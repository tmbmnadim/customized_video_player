import 'package:customized_video_player/view%20models/constructor_test_vm.dart';
import 'package:flutter/material.dart';

import 'constructors_test_page2.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CachedConstructorTestVm cache1 = CachedConstructorTestVm.instance;
  final CachedConstructorTestVm cache2 = CachedConstructorTestVm.instance;
  final ConstructorTestVm constructor1 = ConstructorTestVm();
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
              'Counter 1: ${cache1.age}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Button 1',
              onPressed: () => setState(() => cache1.incrementAndPrintAge()),
            ),
            const SizedBox(height: 40),
            Text(
              'Counter 2: ${constructor1.dage}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Button 2',
              onPressed: () =>
                  setState(() => constructor1.incrementAndPrintAge()),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'NEXT PAGE',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CounterScreen2(),
                ),
              ),
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
