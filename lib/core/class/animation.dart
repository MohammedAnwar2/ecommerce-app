// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final int? time;

  const CustomAnimation({Key? key, required this.child, this.time = 800})
      : super(key: key);

  @override
  _CustomAnimationState createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.time!), vsync: this);
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from below the screen
      end: Offset.zero, // Move to the top of the screen
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class CustomAnimationLeftToRight extends StatefulWidget {
  final Widget child;
  final int? time;

  const CustomAnimationLeftToRight(
      {Key? key, required this.child, this.time = 800})
      : super(key: key);

  @override
  _CustomAnimationLeftToRightState createState() =>
      _CustomAnimationLeftToRightState();
}

class _CustomAnimationLeftToRightState extends State<CustomAnimationLeftToRight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.time!), vsync: this);
    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start from below the screen
      end: Offset.zero, // Move to the top of the screen
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class CustomFadeTransitionAnimation extends StatefulWidget {
  final Widget child;
  final int? time;

  const CustomFadeTransitionAnimation(
      {super.key, required this.child, this.time = 800});

  @override
  _CustomFadeTransitionAnimationState createState() =>
      _CustomFadeTransitionAnimationState();
}

class _CustomFadeTransitionAnimationState
    extends State<CustomFadeTransitionAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.time!),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0, // Start hidden
      end: 1.0, // Fully visible
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
