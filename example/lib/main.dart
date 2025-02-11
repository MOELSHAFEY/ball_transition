import 'package:flutter/material.dart';
import 'package:ball_transition/ball_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ball Transition",
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ball Transition Demo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2A9D8F),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).push(
              createBallTransitionRoute(
                secondPage: const SecondPage(),
                linearGradient_begin: Alignment.topLeft,
                linearGradient_end: Alignment.bottomRight,
                ballColorGradient: [
                  const Color(0xFF264653), 
                  const Color(0xFF2A9D8F),
                  const Color(0xFFE9C46A), 
                ],
                backgroundColor: const Color.fromARGB(
                    255, 255, 251, 248),
                transitionDuration: const Duration(milliseconds: 1200),
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
        title: const Text(
          'Second Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2A9D8F),
      ),
      body: const Center(
        child: Text(
          'Welcome to the second page',
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 20, color: Color.fromARGB(255, 20, 19, 19)),
        ),
      ),
      backgroundColor: const Color.fromARGB(
          255, 251, 255, 255),
    );
  }
}
