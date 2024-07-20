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
            Colors.purple.withOpacity(0.7),
            Colors.black.withOpacity(0.7),
          ],
          stops: const [0.4, 0.1, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(1.7, -1.3), // Điều chỉnh vị trí tâm
            radius: 1, // Tăng bán kính để vùng màu lớn hơn
            colors: [
              Colors.purple,
              const Color.fromARGB(255, 225, 54, 255).withOpacity(0.1),
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0.4, 0.1, 1.0],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.9, 1.5), // Điều chỉnh vị trí tâm
              radius: 1, // Tăng bán kính để vùng màu lớn hơn
              colors: [
                const Color.fromARGB(255, 53, 148, 56),
                const Color.fromARGB(255, 14, 110, 78).withOpacity(0.5),
                Colors.black.withOpacity(0.4),
              ],
              stops: const [0.4, 0.1, 1.0],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
