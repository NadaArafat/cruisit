import 'package:flutter/material.dart';

class ShimmerCategoryCard extends StatelessWidget {
  const ShimmerCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16), // Rounds card corners
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(
                0,
                0,
                0,
                0.15, // Card shadow color and opacity
              ),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}
