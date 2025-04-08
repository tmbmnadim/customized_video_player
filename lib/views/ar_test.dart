import 'package:customized_video_player/widgets/transformable_image.dart';
import 'package:flutter/material.dart';

class ARTEST extends StatelessWidget {
  const ARTEST({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
        ),
        const TransformableImage(
          imagePath: 'assets/image/a.jpg',
          initialWidth: 200,
          initialHeight: 200,
        ),
      ],
    );
  }
}
