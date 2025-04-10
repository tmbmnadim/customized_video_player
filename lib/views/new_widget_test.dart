import 'package:customized_video_player/widgets/nijesso/product_list_horizontal.dart';
import 'package:customized_video_player/widgets/nijesso/simple_product_banner.dart';
import 'package:customized_video_player/widgets/nijesso/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/nijesso/product_card_vertical.dart';

class WidgetTestScreen extends StatefulWidget {
  const WidgetTestScreen({super.key});

  @override
  State<WidgetTestScreen> createState() => _WidgetTestScreenState();
}

class _WidgetTestScreenState extends State<WidgetTestScreen> {
  int productCount = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      appBar: AppBar(
        title: const Text('Widget Test Screen'),
        backgroundColor: const Color(0xFFf6f6f6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Test your widgets here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ProductBanner(
              image: 'assets/image/a.jpg',
              title: 'Product Title',
              buttonText: 'View Details',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
