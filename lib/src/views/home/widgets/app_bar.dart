import 'package:flutter/material.dart';

import '../../../shared/widgets/user_image_button.dart';

class HomeAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
        title: const Text('Trilheiro APP'),
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        foregroundColor: colorScheme.onTertiary,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton()  
          ),
       ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}