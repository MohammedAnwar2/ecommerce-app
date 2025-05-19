import 'dart:async';
import 'package:flutter/material.dart';

class InfiniteScrollPageView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Duration scrollInterval;
  final Duration animationDuration;
  final Curve scrollCurve;
  final double viewportFraction;

  const InfiniteScrollPageView({
    super.key,
    required this.items,
    required this.itemBuilder, // Builder function for item creation
    this.scrollInterval = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 600),
    this.scrollCurve = Curves.easeInOut,
    this.viewportFraction = 1.0,
  });

  @override
  State<InfiniteScrollPageView> createState() =>
      _InfiniteScrollPageViewState<T>();
}

class _InfiniteScrollPageViewState<T> extends State<InfiniteScrollPageView<T>> {
  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);

    _timer = Timer.periodic(widget.scrollInterval, (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: widget.animationDuration,
          curve: widget.scrollCurve,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        int realIndex = index % widget.items.length; // Infinite loop logic
        return widget.itemBuilder(context, widget.items[realIndex]);
      },
    );
  }
}
