
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/core/utils/resources/resources_exporter.dart';
import 'package:nana_mobile_task/core/utils/shared_widgets/load_more_button.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';

class AppGridView extends StatelessWidget {
  final String sectionHeaderTitle;
  final Axis gridScrollDirection;
  final double gridHeightView;
  final int numberOfColumns;
  final List<Results>? productsData;
 
  final dynamic gridDelegateView;
  final Color gridBackgroundColor;
  final bool shouldScroll;
  final bool shouldPresentLoadMoreIndicator;
  final bool shouldPresentLoadMoreButton;


  const AppGridView(
      {super.key,
      this.sectionHeaderTitle = "Snacks Products",
      this.gridScrollDirection = Axis.horizontal,
      this.gridHeightView = 320,
      this.numberOfColumns = 1,
      required this.productsData,
      required this.gridDelegateView,
      this.gridBackgroundColor = Colors.white,
      this.shouldScroll = true,
      this.shouldPresentLoadMoreIndicator = false,
      this.shouldPresentLoadMoreButton = false, 
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: gridHeightView,
        color: gridBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              const SizedBox(
                height: 25,
              ),
           
              // Header Section
              Text(
                sectionHeaderTitle,
                style: const TextStyle(
                    color: ColorManager.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
          
              // Space between header and grid
              const SizedBox(height: 15),
           
              // Grid View
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    physics: shouldScroll ? 
                    const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
                    gridDelegate: gridDelegateView,
                    scrollDirection: gridScrollDirection, 
                    shrinkWrap: true,
                    itemCount: productsData?.length,
                    itemBuilder: (context, index) {
                      //Todo:- Seperate item in other class
                      return Container(
                      //  height: 350,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // will contains the price and the title
                          children: [
                            Stack(
                              children: [
                                // Image
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: (productsData != null && productsData!.isNotEmpty) ? Image.network(
                                          key: Key("$index"),
                                          productsData?[index].image ??
                                              "",
                                          fit: BoxFit.cover,
                                        ): const SizedBox(key: Key("MockImage"),),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  right: 5,
                                  //left: 20,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      // Circle with plus icon
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // Item Price
                            Row(
                              children: [
                                const Text(
                                  'SAR ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  productsData?[index].created
                                          ?.substring(1, 4) ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            // Item description
                            SizedBox(
                              width: 120,
                              child: Text(
                                productsData?[index].location?.name ??
                                    "",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
             
            (shouldPresentLoadMoreButton) ? LoadMoreButton(
                          title: "Load more",
                          isLoading: shouldPresentLoadMoreIndicator,
                          onPressed: () =>
                           context.read<ProductsCubit>()..toggleIndicator(true)..getProductsData(),
                        )
              : const SizedBox(),
            ],
          ),
        ));
  }
}
