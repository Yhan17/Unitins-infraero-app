import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infraero/app/presentation/core/theme/app_colors.dart';

class PassengerTextWidget extends StatelessWidget {
  final String title;
  final String text;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;
  const PassengerTextWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: AppColors.neutralGrey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign,
        )
      ],
    );
  }
}
