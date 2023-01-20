import 'package:flutter/material.dart';

class HorizontalProgressIndicator extends StatefulWidget {
  const HorizontalProgressIndicator({super.key});

  @override
  State<HorizontalProgressIndicator> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<HorizontalProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator',
        ),
      ),
    );
  }
}
