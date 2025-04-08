import 'dart:math' as math;

import 'package:customized_video_player/widgets/the_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformableImage extends StatefulWidget {
  final String imagePath;
  final double initialWidth;
  final double initialHeight;

  const TransformableImage({
    super.key,
    required this.imagePath,
    this.initialWidth = 200,
    this.initialHeight = 200,
  });

  @override
  State<TransformableImage> createState() => _TransformableImageState();
}

class _TransformableImageState extends State<TransformableImage> {
  double _scale = 300;
  double _rotation = 0;
  double _initScale = 300;
  Offset touchPointDiff = const Offset(0, 0);
  Offset _position = const Offset(200, 300);
  Offset _dotPosition = const Offset(50, 50);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _position.dy - _scale * math.sqrt2 * 0.25 - 20,
          left: _position.dx - _scale * math.sqrt2 * 0.25 - 20,
          child: Transform.rotate(
            angle: _rotation,
            child: Container(
              width: _scale,
              height: _scale,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: CupertinoColors.black,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onScaleStart: (details) {
                        if (details.pointerCount == 2) {
                          _initScale = _scale;
                        }
                        if (details.pointerCount == 1) {
                          touchPointDiff = Offset(
                            _scale * math.sqrt2 * 0.25 -
                                33 -
                                details.localFocalPoint.dx,
                            _scale * math.sqrt2 * 0.25 -
                                33 -
                                details.localFocalPoint.dy,
                          );
                        }
                      },
                      onScaleUpdate: (details) {
                        if (details.pointerCount == 2) {
                          _scale = _initScale * details.scale;
                          setState(() {});
                        }
                        if (details.pointerCount == 1) {
                          setState(() {
                            _position = details.focalPoint + touchPointDiff;
                          });
                        }
                      },
                      child: ArDrawTemplateBox(
                        template: "assets/image/a.jpg",
                        scale: _scale - (_scale * 0.25 * math.sqrt2),
                        isPng: true,
                        opacity: 1.0,
                        flip: false,
                      ),
                    ),
                  ),
                  Positioned(
                    right: (_scale * 0.18) - 20,
                    bottom: (_scale * 0.18) - 20,
                    // top: _dotPosition.dy,
                    // left: _dotPosition.dx,
                    child: GestureDetector(
                      onScaleUpdate: (details) {
                        _dotPosition = details.focalPoint -
                            Offset(
                              _position.dx - _scale * math.sqrt2 * 0.25,
                              _position.dy - _scale * math.sqrt2 * 0.25,
                            );
                        double offsetAngle = 45 * math.pi / 180;
                        double angle = math.atan2(
                          _dotPosition.dy - _scale / 2,
                          _dotPosition.dx - _scale / 2,
                        );
                        _rotation = angle - offsetAngle;
                        setState(() {});
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF0096AA),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.lock_rotation_open,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
