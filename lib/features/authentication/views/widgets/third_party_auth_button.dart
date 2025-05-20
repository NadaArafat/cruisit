import 'package:flutter/material.dart';

class ThirdPartyAuthButton extends StatelessWidget {
  const ThirdPartyAuthButton({
    super.key,
    required this.image,
    required this.text,
    required this.color,
    required this.textColor,
  });

  final String image;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.15),
          Image.asset(image, width: 40, height: 40),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
