import 'package:flutter/material.dart';

import 'product_price_text.dart';
import 'product_stock_status.dart';
import 'star_rating_product_card.dart';
import 'text_button.dart';

class ProductCardVertical extends StatelessWidget {
  final double height = 420;
  final double width = 200;

  final String productName;
  final String productCategory;
  final String productSKU;
  final String productImage;
  final String productPrice;
  final String? productOldPrice;
  final double productRating;
  final bool isInStock;
  final bool isFavorite;
  final Function() onTap;
  final Function(String)
      onFavouriteTap; // Pass the product SKU or ID to identify the product
  final Function() onAddToCartTap;

  const ProductCardVertical({
    super.key,
    required this.productName,
    required this.productCategory,
    required this.productSKU,
    required this.productImage,
    required this.productPrice,
    this.productOldPrice,
    required this.productRating,
    required this.isInStock,
    required this.isFavorite,
    required this.onTap,
    required this.onFavouriteTap,
    required this.onAddToCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            color: const Color(0xFFffffff),
            shadowColor: const Color(0x55000000),
            elevation: 5,
            child: SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: width,
                        height: width,
                        child: Center(
                          child: Image.asset(
                            productImage,
                            fit: BoxFit.cover,
                            width: width,
                            height: width,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: width,
                      child: Text(
                        productName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      child: Text(
                        productCategory,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Color(0xFF6f6f6f),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: width,
                      child: StarRating(
                        size: 15,
                        starCount: 5,
                        rating: productRating,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ProductStockStatus(
                      isInStock: isInStock,
                    ),
                    const SizedBox(height: 10),
                    ProductPriceText(
                      price: productPrice,
                      oldPrice: productOldPrice,
                    ),
                    const SizedBox(height: 10),
                    CustomTextButton(
                      text: "Add to Cart",
                      onTap: onAddToCartTap,
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: width,
                      height: 15,
                      child: RichText(
                        text: TextSpan(
                          text: 'SKU: ',
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: productSKU,
                              style: const TextStyle(
                                color: Color(0xFF6f6f6f),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Card(
                color: Colors.white,
                shadowColor: const Color(0x55000000),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? const Color(0xFF1c61e7) : Colors.grey,
                  ),
                ),
              ),
              onPressed: () {
                onFavouriteTap(productName);
              },
              tooltip:
                  isFavorite ? 'Remove from favorites' : 'Add to favorites',
            ),
          ),
        ],
      ),
    );
  }
}
