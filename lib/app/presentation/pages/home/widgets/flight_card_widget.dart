import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'dart:math' as math;

import '../../../core/theme/app_colors.dart';

class FlightCardWidget extends StatelessWidget {
  const FlightCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).pushNamed('/flight-detail');
      },
      child: Container(
        height: 200,
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 19),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Palmas\n(PMW)',
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Flexible(
                  child: Text(
                    'Guarulhos\n(GRU)',
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saída:\n01/11/2021',
                  style: GoogleFonts.poppins(
                    color: AppColors.neutralGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Voô:\n3989',
                  style: GoogleFonts.poppins(
                    color: AppColors.neutralGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: FixedTimeline.tileBuilder(
                      theme: TimelineTheme.of(context).copyWith(
                        direction: Axis.horizontal,
                        color: AppColors.primaryColor,
                        connectorTheme: const ConnectorThemeData(
                          space: 40.0,
                          thickness: 2.0,
                        ),
                        nodePosition: 0,
                      ),
                      builder: TimelineTileBuilder.connected(
                        indicatorBuilder: (_, index) {
                          if (index == 1) {
                            return ContainerIndicator(
                              child: Transform.rotate(
                                angle: 90 * math.pi / 180,
                                child: Icon(
                                  Icons.airplanemode_active,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            );
                          }
                          return DotIndicator(
                            color: AppColors.primaryColor,
                          );
                        },
                        connectorBuilder: (_, index, type) {
                          return DashedLineConnector(
                            color: AppColors.primaryColor,
                          );
                        },
                        itemExtent: 100.0,
                        itemCount: 3,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  r'R$ 689,90',
                  style: GoogleFonts.poppins(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Ver detalhes...',
                  style: GoogleFonts.poppins(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
