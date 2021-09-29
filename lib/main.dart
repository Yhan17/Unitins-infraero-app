import 'package:flutter/material.dart';

import 'app/presentation/core/app_widget.dart';
import 'env.dart';

void main() async {
  await Env.init();
  runApp(const AppWidget());
}