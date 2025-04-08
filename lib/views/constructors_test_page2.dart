import 'package:customized_video_player/view%20models/constructor_test_vm.dart';
import 'package:flutter/material.dart';

class CounterScreen2 extends StatefulWidget {
  const CounterScreen2({super.key});

  @override
  State<CounterScreen2> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen2> {
  final CachedConstructorTestVm cache2 = CachedConstructorTestVm.instance;
  final ConstructorTestVm constructor2 = ConstructorTestVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter 1: ${cache2.age}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Cached',
              onPressed: () => setState(() => cache2.incrementAndPrintAge()),
            ),
            const SizedBox(height: 40),
            Text(
              'Counter 2: ${constructor2.dage}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Not Cached',
              onPressed: () =>
                  setState(() => constructor2.incrementAndPrintAge()),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
