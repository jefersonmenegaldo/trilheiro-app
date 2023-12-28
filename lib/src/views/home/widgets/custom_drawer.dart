import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trilheiro/src/models/user.model.dart';
import 'package:trilheiro/src/shared/state/user_state.dart';

import '../../../shared/stores/app.store.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = ModularWatchExtension(context).watch<AppStore>(
      (store) => store.syncDate,
    );

    final syncDate = appStore.syncDate.value;
    var syncDateText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy às hh:mm');
      syncDateText = format.format(syncDate);
    }

    final userState = Provider.of<UserState>(context, listen: false);
    var user = userState.user;

    userNavigation() {
      final label = user?.id == null ? 'Entrar' : 'Sair';
      final icon = user?.id == null ? Icons.people : Icons.exit_to_app;
      return NavigationDrawerDestination(icon: Icon(icon), label: Text(label));
    }

    deslogar() {
      userState.setUser(User());
      ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Deslogado com sucesso!')));
      Navigator.of(context).pop();
      Modular.to.navigate('/');      
    }

    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 0) {
          if (user?.id == null) {
            Navigator.of(context).pop();
            Modular.to.navigate('/login');
          } else {
            deslogar();
          }
        }
        if (index == 1) {
          //Navigator.of(context).pop();
          //Modular.to.navigate('/config');
        }
        if (index == 2) {
          Navigator.of(context).pop();
          Modular.to.navigate('/config');
        }
      },
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 28, right: 16, left: 16, bottom: 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        userNavigation(),
        NavigationDrawerDestination(
            icon: const Icon(Icons.sync),
            label: SizedBox(
              width: 210,
              child: Row(
                children: [
                  const Text('Sincronizar'),
                  const Spacer(),
                  Text(
                    syncDateText,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            )),
        const NavigationDrawerDestination(
            icon: Icon(Icons.settings), label: Text('Configurações'))
      ],
    );
  }
}
