import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  final String price;
  final String? oldPrice;
  const ProductPriceText({
    super.key,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (oldPrice != null)
            Text(
              '\$$oldPrice',
              style: const TextStyle(
                color: Color(0xFFbfbfbf),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 3,
                decorationColor: Color(0xFFbfbfbf),
              ),
            ),
          const SizedBox(width: 5),
          Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
