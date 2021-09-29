import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/default_modal_widget.dart';

class ErrorModalWidget extends DefaultModalWidget {
  final String text;
  const ErrorModalWidget({
    Key? key,
    required this.text,
  }) : super(
          key: key,
          name: 'error-modal',
        );

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          ],
        ),
        Text(text)
      ],
    );
  }
}
