import 'package:customized_video_player/provider/counter_provider.dart';
import 'package:customized_video_player/provider/counter_provider_2.dart';
import 'package:customized_video_player/views/ar_test.dart';
import 'package:customized_video_player/views/future_test.dart';
import 'package:customized_video_player/views/homepage.dart';
import 'package:customized_video_player/views/provider_test.dart';
import 'package:customized_video_player/widgets/custom_loading.dart';
import 'package:customized_video_player/widgets/transformable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'views/constructors_test.dart';
import 'views/new_widget_test.dart';

void main() {
  runApp(const CustomVideoPlayer());
}

class CustomVideoPlayer extends StatelessWidget {
  const CustomVideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CounterProvider2(),
        ),
      ],
      child: MaterialApp(
        title: 'Customized Video Player',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const ARTEST(),
        // home: const Homepage(
        //   url:
        //       "https://drive.usercontent.google.com/uc?id=1950EHyw49P_0saK4gwLR8wrLuhGtoxzb&export=download",
        // ),
        home: const WidgetTestScreen(),
      ),
    );
  }
}
