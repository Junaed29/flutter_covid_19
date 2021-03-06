import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../res.dart';
import 'world_states/world_states_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (Context) => WorldStatesScreen())));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                builder: (context, widget) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: Center(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(Res.virus),
                      ),
                    ),
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            const Text(
              "Covid-19\nTracker App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
