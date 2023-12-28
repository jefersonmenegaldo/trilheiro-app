import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trilheiro/src/shared/themes/themes.dart';
import 'package:trilheiro/src/shared/stores/app.store.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {

    Modular.setInitialRoute('/splash');
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      title: 'Trilheiro',
      debugShowCheckedModeBanner: false,
      themeMode: appStore.themeMode.value,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: Modular.routerDelegate,
      //routerConfig: Modular.routerConfig,
      routeInformationParser: Modular.routeInformationParser,
      scaffoldMessengerKey: scaffoldMessengerKey,
      
    );
  }
}

