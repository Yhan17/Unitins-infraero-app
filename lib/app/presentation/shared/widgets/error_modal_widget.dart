import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'default_modal_widget.dart';

class ErrorModalWidget extends DefaultModalWidget {
  final String text;
  final double radius;

  const ErrorModalWidget({
    Key? key,
    required this.text,
    this.radius = 20,
  }) : super(
          key: key,
          name: 'error-modal',
        );

  @override
  Widget buildContent(BuildContext context) {
    final size = radius * 2;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: Colors.red[200],
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColors.primaryColor,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        )
      ],
    );
  }
}
