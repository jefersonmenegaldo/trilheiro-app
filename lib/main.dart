import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trilheiro/src/app.widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:trilheiro/src/shared/state/user_state.dart';

import 'src/app_module.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserState(),
        ),
      ],
      child: ModularApp(
        module: AppModule(),
        debugMode: false,
        child: const AppWidget(),
      ),
    ),
  );
}
