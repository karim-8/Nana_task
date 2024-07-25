import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/core/utils/shared_widgets/app_grid_view.dart';
import 'package:nana_mobile_task/core/utils/shared_widgets/grid_utilities.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';
import '/core/utils/resources/resources_exporter.dart';
import '/core/utils/shared_widgets/main_scaffold.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: ColorManager.lightPink,
          centerTitle: true,
          title: Text(
            StringsManager.products,
            style: TextStyleManager.screenTitle,
          ),
        ),

        body: SingleChildScrollView(
             // physics: const BouncingScrollPhysics(),
              child: 
              Container(
                color: ColorManager.blackColor,
                child: Column(
                  children: [
                    
                    /// Snacks Section
                       BlocBuilder<ProductsCubit, ProductsStateBase>(
                        builder: (context, state) {

                          if(state is ProductsState) {
    
                             log("Data is ${state.productsData ?? "No Data"}");
                            return AppGridView(
                              gridDelegateView: horizontalGridDelegate(),
                              sectionHeaderTitle: "Snacks Product",
                              gridScrollDirection: Axis.horizontal,
                              productsData: state.results,
                              gridHeightView: 350,
                              shouldScroll: true,
                              gridBackgroundColor: Colors.white,);
                          }
                          return const SizedBox();
                        },
                      ),


    
               
       // Middle part here

                       BlocBuilder<ProductsCubit, ProductsStateBase>(
                        builder: (context, state) {
                          if(state is ProductsState) {
                             log("Data is ${state.productsData ?? "No Data"}");
                             // check items number
      
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: AppGridView(
                                shouldPresentLoadMoreIndicator: state.indicatorStatus,
                                shouldPresentLoadMoreButton: true,
                                gridBackgroundColor: Colors.white,
                                gridHeightView: state.gridHeightSize!.toDouble(),
                                numberOfColumns: 3,
                                shouldScroll: false,
                                gridScrollDirection: Axis.vertical,
                                sectionHeaderTitle: "Most use product",
                                productsData: state.results,
                               gridDelegateView: verticalGridDelegate(),),
                            );
                          }
                          return const SizedBox();
                        },
                      ),



                   

               
      // Recommende Section
                        BlocBuilder<ProductsCubit, ProductsStateBase>(
                        builder: (context, state) {
                          if(state is ProductsState) {
                             log("Data is ${state.productsData ?? "No Data"}");
                            return AppGridView(
                              sectionHeaderTitle: "Recommendation",
                            productsData: state.results,
                             gridDelegateView: horizontalGridDelegate(),
                             gridScrollDirection: Axis.horizontal,);
                          }
                          return const SizedBox();
                        },
                      ),



                  ],
                ),
              ),


            ),
          
        
      ),
    );
  }
}



