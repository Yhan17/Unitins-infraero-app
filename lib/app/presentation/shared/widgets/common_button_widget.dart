import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class CommonButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool busy;
  final VoidCallback? onTap;

  const CommonButtonWidget({
    Key? key,
    required this.text,
    this.icon = Icons.arrow_forward_ios_outlined,
    this.busy = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        decoration: BoxDecoration(
          color:
              onTap != null ? AppColors.primaryColor : AppColors.disabledColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              busy
                  ? const SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        strokeWidth: 2,
                      ),
                    )
                  : Icon(
                      icon,
                      color: Colors.white,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
