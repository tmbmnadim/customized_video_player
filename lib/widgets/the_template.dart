import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class ArDrawTemplateBox extends StatelessWidget {
  final String template;
  final double scale;
  final bool isPng;
  final double opacity;
  final bool flip;
  const ArDrawTemplateBox({
    super.key,
    required this.template,
    required this.scale,
    required this.isPng,
    required this.opacity,
    required this.flip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scale,
      width: scale,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: CupertinoColors.black,
        ),
      ),
      child: Opacity(
        opacity: opacity,
        child: Transform.flip(
          flipX: flip,
          child: Padding(
            padding: EdgeInsets.all(scale * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: isPng
                  ? Image.asset(
                      template,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(template),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
