import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Function() onTap;
  final double contentPadding;
  final Color splashColor;
  final Color color;
  final Color disabledColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Alignment alignment;
  final double width;
  final double height;
  final DecorationImage? decorationImage;

  const CustomButton({
    super.key,
    required this.child,
    required this.onTap,
    this.enabled = true,
    this.contentPadding = 10,
    this.alignment = Alignment.center,
    this.splashColor = Colors.white,
    this.color = Colors.black,
    this.disabledColor = Colors.grey,
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.borderRadius = 10,
    this.width = 350,
    this.height = 60,
    this.decorationImage,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        splashColor: enabled ? splashColor : const Color(0x00FFFFFF),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            image: decorationImage,
          ),
          child: Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Align(
              alignment: alignment,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
