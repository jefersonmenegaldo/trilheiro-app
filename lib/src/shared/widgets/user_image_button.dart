import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilheiro/src/shared/state/user_state.dart';

class UserImageButton extends StatelessWidget {
  const UserImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userState = Provider.of<UserState>(context, listen: false);
    var user = userState.user;
    final letter = userState.user?.name?.substring(0, 1) ?? 'A';

    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: Text(letter.toUpperCase()),
      ),
      onTap: () {
        final userName = user?.name ?? 'Não logado...';

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userName)));
      },
    );
  }
}
