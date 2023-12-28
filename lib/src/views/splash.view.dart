import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:trilheiro/src/views/login/login.view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
            duration: 3000,
            splashIconSize: 1000,
            splash: Image.asset('assets/images/splash.jpeg', centerSlice: const Rect.fromLTRB(0, 0, 1000, 1000),),
            nextScreen: const LoginView(),
            splashTransition: SplashTransition.fadeTransition,            
            backgroundColor:const Color.fromARGB(255, 14, 70, 17))
      );
  }
}
