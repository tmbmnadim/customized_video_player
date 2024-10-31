import 'dart:io';
import 'package:customized_video_player/widgets/progress_indicator.dart';
import 'package:customized_video_player/widgets/progressed_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatefulWidget {
  final String? assetPath;
  final String? filePath;
  final String? url;
  const Homepage({
    super.key,
    this.assetPath,
    this.filePath,
    this.url,
  }) : assert(assetPath != null || filePath != null || url != null);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SizedBox.expand(
        child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (_, snapshot) {
              return Center(
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: scrSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF000000),
                        ),
                        child: isLoading(snapshot)
                            ? null
                            : VideoPlayer(_controller),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: scrSize.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0x44000000),
                        ),
                        child: ProgressedChild(
                          condition: isLoading(snapshot),
                          child: const Center(child: Text("OH")),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void initializePlayer() {
    if (widget.assetPath != null) {
      _controller = VideoPlayerController.asset(widget.assetPath!);
    } else if (widget.filePath != null) {
      _controller = VideoPlayerController.file(File(widget.filePath!));
    } else if (widget.url != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));
    }
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  bool isLoading(AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return false;
    } else {
      return true;
    }
  }
}
