import 'package:flutter/material.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';

class AppGridItem extends StatelessWidget {
  final int itemIndex;
  final List<Results>? productsData;

  const AppGridItem(
      {super.key, required this.productsData, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: (productsData != null && productsData!.isNotEmpty)
                        ? Image.network(
                            key: Key("$itemIndex"),
                            productsData?[itemIndex].image ?? "",
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(
                            key: Key("MockImage"),
                          ),
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
              productsData?[itemIndex].created?.substring(1, 4) ?? "",
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
            productsData?[itemIndex].location?.name ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
