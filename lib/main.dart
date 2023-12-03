import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trilheiro/src/app.widget.dart';

import 'src/app_module.dart';

void main() {
    return runApp(
      ModularApp(
        module: AppModule(), 
        child: const AppWidget()
      )
    );
}