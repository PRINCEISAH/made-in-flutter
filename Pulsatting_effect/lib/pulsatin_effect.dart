import 'package:flutter/material.dart';

class PulsatingEffect extends StatefulWidget {
  const PulsatingEffect({super.key});

  @override
  State<PulsatingEffect> createState() => _PulsatingEffectState();
}

class _PulsatingEffectState extends State<PulsatingEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            if (mounted) {
              setState(() {});
            }
          })
          ..repeat();

    _animation = Tween(begin: 0.0, end: 180.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceIn)));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Transform.scale(
        scale: _animation.value,
        child: Icon(Icons.card_travel),
      )),
    );
  }
}
