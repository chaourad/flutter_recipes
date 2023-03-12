import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;

  const GreenButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(2, -2)),
        ],
        color: const Color.fromRGBO(90, 145, 95, 0.988),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'PT_Serif',
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(2, -2)),
          ],
        ),
      ),
    );
  }
}
