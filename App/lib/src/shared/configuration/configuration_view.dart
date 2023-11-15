import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/stores/app.store.dart';

class ConfigurationView extends StatefulWidget {
  const ConfigurationView({super.key});

  @override
  State<ConfigurationView> createState() => _ConfigurationViewState();
}

class _ConfigurationViewState extends State<ConfigurationView> {
  @override
  Widget build(BuildContext context) {

    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Configurações'),),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configurações', 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20,),
            Text('Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10,),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              title: const Text('Sistema'),
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              title: const Text('Claro'),
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              title: const Text('Escuro'),
              onChanged: appStore.changeThemeMode,
            ),
            const SizedBox(height: 20,),
            Text('Controle de dados',
              style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(height: 10,),
            OutlinedButton(
              onPressed: appStore.deleteApp,
              child: const Text('Apagar cache reiniciar o app')
            ),  
          ],
        ),
      ),
    );
  }
}