import 'package:flutter/material.dart';

import 'text_button.dart';

class ProductBanner extends StatelessWidget {
  final String image;
  final String title;
  final String? subtitle;
  final String buttonText;
  final Function() onTap;
  const ProductBanner({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    this.buttonText = "View Details",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: scrSize.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF555555).withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFf6f6f6),
                  ),
                ),
              CustomTextButton(
                text: buttonText,
                color: Colors.white,
                textColor: const Color(0xFF555555),
                width: 120,
                onTap: onTap,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
