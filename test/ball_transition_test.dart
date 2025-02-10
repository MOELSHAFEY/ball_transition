import 'package:flutter/material.dart';
import 'package:ball_transition/ball_transition.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
//by moelshafey
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ball Transition Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              createBallTransitionRoute(
                secondPage: const SecondPage(),
                ballColorGradient: [
                  Colors.red,
                  Colors.orange
                ], // يجب أن تحتوي على لونين على الأقل
                backgroundColor: const Color.fromARGB(255, 246, 251, 253), //لون الخلفيه
                transitionDuration:
                    const Duration(milliseconds: 1500), // تخصيص زمن التنفيذ
              ),
            );
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('Welcome to the second page by moelshafey'),
      ),
    );
  } //by moelshafey
}
