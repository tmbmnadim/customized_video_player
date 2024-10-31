import 'package:customized_video_player/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CustomVideoPlayer());
}

class CustomVideoPlayer extends StatelessWidget {
  const CustomVideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customized Video Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(
        url:
            "https://drive.usercontent.google.com/uc?id=1950EHyw49P_0saK4gwLR8wrLuhGtoxzb&export=download",
      ),
    );
  }
}
