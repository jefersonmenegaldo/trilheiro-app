import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trilheiro/src/models/user.model.dart';
import 'package:trilheiro/src/repositories/user.repository.dart';
import 'package:trilheiro/src/services/user.service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int _state = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService(UserRepository(), context);

    makeLoginAfter() async {
      var user = User(
          email: 'anonimo@mngd.com', password: 'j3f3rs0n');
      var isOk = await userService.userLogin(user);
      if (!isOk) {
        setState(() {
          _state = 0;
        });
      }
      userService.saveUser(User());
      Modular.to.navigate('/');
    }

    login() async {
      try {
        var user = User(
            email: emailController.text, password: passwordController.text);
        var isOk = await userService.userLogin(user);
        if (!isOk) {
          setState(() {
            _state = 0;
          });
        }
        Modular.to.navigate('/');
      } catch (e) {
        setState(() {
          _state = 0;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      alignment: Alignment.center,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Trilheiro APP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'OpenSans',
                          letterSpacing: 0.1),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontFamily: 'OpenSans',
                        letterSpacing: 0.1),
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(emailController, Icons.email, 'Email', false),
                  const SizedBox(height: 15),
                  _buildTextField(
                      passwordController, Icons.lock, 'Senha', true),
                  const SizedBox(height: 30),
                  MaterialButton(
                    elevation: 0,
                    minWidth: double.maxFinite,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    height: 50,
                    onPressed: () {
                      if (checkRegister(emailController, passwordController)) {
                        setState(() {
                          if (_state == 0) {
                            animateButton();
                            login();
                          }
                        });
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: setUpButtonChild(),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    elevation: 0,
                    minWidth: double.maxFinite,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    height: 50,
                    onPressed: makeLoginAfter,
                    color: Colors.black,
                    textColor: Colors.white,
                    child: const Text('Fazer login depois..',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(height: 35),
                  const Align(
                    alignment: Alignment.bottomCenter,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return const Text('Entrar',
          style: TextStyle(color: Colors.white, fontSize: 16));
    } else if (_state == 1) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return const Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(const Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }

  checkRegister(TextEditingController email, TextEditingController senha) {
    if (email.text.isEmpty) {
      _alert('Email não informado');
      return false;
    }
    if (senha.text.isEmpty) {
      _alert('Senha não informada');
      return false;
    }
    return true;
  }

  _alert(String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  _buildTextField(TextEditingController controller, IconData icon,
      String labelText, bool pass) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 87, 85, 85),
        borderRadius: BorderRadius.all(Radius.circular(17.0)),
      ),
      child: TextField(
        controller: controller,
        obscureText: pass,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
