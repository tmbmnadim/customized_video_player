import 'dart:math';

import 'package:flutter/material.dart';

class FutureTest extends StatefulWidget {
  const FutureTest({super.key});

  @override
  State<FutureTest> createState() => _FutureTestState();
}

class _FutureTestState extends State<FutureTest> {
  bool _itsNotRandomAnymore = false;
  late Future<void> aFuture;

  @override
  void initState() {
    super.initState();
    aFuture = futureFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: FutureBuilder<void>(
        future: futureFunction(),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.done &&
              _itsNotRandomAnymore &&
              !snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {}),
                  child: const Text("Re-DO"),
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Error",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {}),
                  child: const Text("Retry"),
                )
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> futureFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    var rand = Random();
    var randomNumber = rand.nextInt(100) + 1;
    if (randomNumber % 2 == 0) {
      _itsNotRandomAnymore = true;
    } else {
      throw Future.error("It's too random!");
    }
  }
}
