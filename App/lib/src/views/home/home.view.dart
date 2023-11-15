import 'package:flutter/material.dart';

import '../../shared/widgets/user_image_button.dart';
import 'widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Trilheiro APP'),
        backgroundColor: colorScheme.tertiary,
        foregroundColor: colorScheme.onTertiary,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton()  
          ),
       ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ],
        ),
      ),
    );
  }

   
}