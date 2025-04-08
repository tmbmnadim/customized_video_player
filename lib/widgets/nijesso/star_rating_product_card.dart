import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Function(double)? onRatingChanged;
  final double size;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0.0,
    this.onRatingChanged,
    this.size = 40,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late double _currentRating;

  @override
  void initState() {
    _currentRating = widget.rating;
    super.initState();
  }

  Widget buildStar(int index) {
    IconData icon = index < _currentRating ? Icons.star : Icons.star_border;
    Color color = index < _currentRating ? Colors.amber : Colors.grey.shade400;

    return GestureDetector(
      onTap: () {
        if (widget.onRatingChanged == null) return;
        setState(() {
          _currentRating = index + 1.0;
        });
        widget.onRatingChanged!(_currentRating);
      },
      child: Icon(
        icon,
        color: color,
        size: widget.size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, buildStar),
    );
  }
}
