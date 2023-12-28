import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:trilheiro/src/shared/configuration/configuration_view.dart';
import 'package:trilheiro/src/views/home/home.view.dart';
import 'package:trilheiro/src/views/splash.view.dart';

import 'shared/configuration/services/configuration_service.dart';
import 'shared/services/realm/real_config.dart';
import 'shared/stores/app.store.dart';
import 'views/login/login.view.dart';
import 'views/register/register.view.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance<Realm>(Realm(config));
    i.add<ConfigurationService>(ConfigurationServiceImpl.new);
    i.addSingleton(AppStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeView());
    r.child('/login', child: (context) => const LoginView());
    r.child('/config', child: (context) => const ConfigurationView());
    r.child('/register', child: (context) => const RegisterView());
    r.child('/splash', child: (context) => const SplashView());
  }
}
