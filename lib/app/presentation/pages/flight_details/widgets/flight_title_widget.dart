import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightTitleWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const FlightTitleWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
