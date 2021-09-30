import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class FlightInformationItemWidget extends StatelessWidget {
  const FlightInformationItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        constraints: const BoxConstraints(
          maxHeight: 115,
          maxWidth: 115,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: AppColors.cardColor,
          boxShadow: const [
             BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_today,
              color: AppColors.primaryColor,
            ),
            Text(
              'Saída',
              style: GoogleFonts.poppins(
                color: AppColors.neutralGrey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Text(
                '01/11/2021',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
