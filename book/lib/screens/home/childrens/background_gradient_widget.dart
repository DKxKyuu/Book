import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: RadialGradient(
          center: const Alignment(-2, -0.1), // Điều chỉnh vị trí tâm
          radius: 1, // Tăng bán kính để vùng màu lớn hơn
          colors: [
            Colors.purple,
            Colors.purple.withOpacity(0.4),
            Colors.black.withOpacity(0.7),
          ],
          stops: const [0.4, 0.1, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(1.8, -1.3), // Điều chỉnh vị trí tâm
            radius: 1, // Tăng bán kính để vùng màu lớn hơn
            colors: [
              Colors.purple,
              Colors.purple.withOpacity(0.4),
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0.4, 0.1, 1.0],
          ),
        ),
        child: child,
      ),
    );
  }
}
