import 'dart:math';

import 'package:customized_video_player/provider/counter_provider.dart';
import 'package:customized_video_player/provider/counter_provider_2.dart';
import 'package:customized_video_player/widgets/a_stateless_test_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTestPage extends StatefulWidget {
  const ProviderTestPage({super.key});

  @override
  State<ProviderTestPage> createState() => _ProviderTestPageState();
}

class _ProviderTestPageState extends State<ProviderTestPage> {
  int _count = 0;
  Future<void> aFuture = Future<void>.delayed(const Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    String count = Provider.of<CounterProvider>(context).count.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Test Page'),
      ),
      body: FutureBuilder<void>(
          future: aFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container();
            }
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                AWidget(count: _count),
                Consumer<CounterProvider2>(builder: (context, provider, child) {
                  Color color = _getRandomColor();
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                    ),
                    onPressed: () {
                      _count++;
                      provider.incrementFirst();
                      // setState(() {});
                    },
                    child: Text(provider.count3.toString()),
                  );
                }),
                Consumer<CounterProvider>(
                  builder: (context, provider, child) {
                    Color color = _getRandomColor();
                    return Column(
                      children: [
                        Consumer<CounterProvider2>(
                            builder: (context, provider, child) {
                          Color color = _getRandomColor();
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color,
                            ),
                            onPressed: () => provider.incrementFirst(),
                            child: Text(count),
                          );
                        }),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                          ),
                          onPressed: () => provider.incrementFirst(),
                          child: Text(provider.count.toString()),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          }),
    );
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }
}
