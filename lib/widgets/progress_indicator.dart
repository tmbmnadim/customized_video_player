import 'package:customized_video_player/widgets/custom_alignment.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double height;
  final Color barColor;
  final Color backgroundColor;
  final double barWidthFactor;
  final CustomAlignment alignment;

  const CustomProgressIndicator({
    super.key,
    this.height = 5,
    this.barColor = const Color(0xFFFFFFFF),
    this.backgroundColor = const Color(0xAAAAAAAA),
    this.barWidthFactor = 0.1,
    this.alignment = CustomAlignment.top,
  });

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..forward()
      ..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return SizedBox.expand(
      child: Align(
        alignment: widget.alignment == CustomAlignment.top
            ? Alignment.topCenter
            : widget.alignment == CustomAlignment.bottom
                ? Alignment.bottomCenter
                : Alignment.center,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: widget.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
              ),
              child: LayoutBuilder(builder: (context, constrants) {
                return Transform.translate(
                  offset: Offset(
                      (constrants.maxWidth -
                              (constrants.maxWidth * widget.barWidthFactor)) *
                          _animation.value,
                      0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: widget.height,
                      width: constrants.maxWidth * widget.barWidthFactor,
                      decoration: BoxDecoration(
                        color: widget.barColor,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
