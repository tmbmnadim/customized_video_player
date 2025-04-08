import 'dart:math';

import 'package:flutter/material.dart';

import 'product_card_vertical.dart';

class ProductListHorizontal extends StatelessWidget {
  final int productList; // This has to be List<ProductModel>
  const ProductListHorizontal({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return SizedBox(
      width: scrSize.width,
      height: 470,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: scrSize.width,
              child: const Text(
                'Product List Tag',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: scrSize.width,
            height: 430,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  ListView.builder(
                    itemCount: min(10, productList),
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ProductCardVertical(
                        productName: 'Product Name $index',
                        productCategory: 'Product Category $index',
                        productSKU: 'dfsdfe3f34',
                        productImage: 'assets/image/a.jpg',
                        productPrice: '19.99',
                        productOldPrice: index.isOdd ? null : '29.99',
                        productRating: index % 5,
                        isInStock: index.isEven,
                        isFavorite: false,
                        onTap: () {
                          // Handle card tap
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product Card Clicked!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        onFavouriteTap: (name) {
                          // Handle add to cart tap
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Favourite Clicked: $name'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        onAddToCartTap: () {
                          // Handle add to cart tap
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to Cart!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
