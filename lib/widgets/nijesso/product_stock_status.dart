import 'package:flutter/material.dart';

class ProductStockStatus extends StatelessWidget {
  final bool isInStock;
  const ProductStockStatus({super.key, required this.isInStock});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isInStock)
            const Icon(
              Icons.check,
              color: Color(0xFF1c61e7),
              size: 15,
            )
          else
            const Icon(
              Icons.close,
              color: Color.fromARGB(255, 255, 56, 56),
              size: 15,
            ),
          const SizedBox(width: 5),
          Text(
            isInStock ? 'In Stock' : 'Not in stock',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
