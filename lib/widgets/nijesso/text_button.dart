import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = const Color(0xFF1c61e7),
    this.textColor = const Color(0xFFFFFFFF),
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.center,
    this.alignment = Alignment.center,
    this.splashColor = const Color(0x44000000),
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
    this.borderWidth = 0,
    this.width = 187,
    this.height = 42,
    this.contentPadding = 10,
    this.extraLeft = 0,
    this.extraRight = 0,
    this.enabled = false,
  });
  final Function() onTap;
  final Color color;
  final Color? textColor;
  final Color splashColor;
  final Color borderColor;
  final double borderWidth;
  final TextAlign textAlign;
  final Alignment alignment;
  final double borderRadius;
  final double width;
  final double? height;
  final double contentPadding;
  final double extraLeft;
  final double extraRight;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final bool enabled;

  Color invert(Color color) {
    final r = 255 - color.red;
    final g = 255 - color.green;
    final b = 255 - color.blue;

    return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: width,
      height: height ?? width / 8,
      color: color,
      borderColor: borderColor,
      borderWidth: borderWidth,
      splashColor: splashColor,
      borderRadius: borderRadius,
      alignment: alignment,
      contentPadding: contentPadding,
      onTap: onTap,
      enabled: enabled,
      child: Padding(
        padding: EdgeInsets.only(
          left: extraLeft,
          right: extraRight,
        ),
        child: Text(
          text,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: textColor ?? invert(color),
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
