import 'package:flutter/material.dart';

class AuthLoadingIndicator extends StatefulWidget {
  const AuthLoadingIndicator({super.key, this.text = 'Loading...'});

  final String text;

  @override
  State<AuthLoadingIndicator> createState() => _AuthLoadingIndicatorState();
}

class _AuthLoadingIndicatorState extends State<AuthLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.11;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 6.28,
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                    Colors.deepPurple,
                    Colors.blue,
                  ],
                  stops: const [0.0, 0.5, 0.9, 1.0],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          widget.text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
