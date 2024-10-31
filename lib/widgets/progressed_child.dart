// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:customized_video_player/widgets/custom_alignment.dart';
import 'package:flutter/material.dart';

import 'package:customized_video_player/widgets/progress_indicator.dart';

class ProgressedChild extends StatelessWidget {
  final bool condition;
  final Widget child;
  const ProgressedChild({
    super.key,
    required this.condition,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return const Align(
        alignment: Alignment.topCenter,
        child: CustomProgressIndicator(
          alignment: CustomAlignment.top,
        ),
      );
    } else {
      return child;
    }
  }
}
