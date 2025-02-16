import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_chat/features/authentication/authentication.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EditProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_UserId(), _LogoutButton()],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Logout'),
      onPressed: () {
        context.read<AuthenticationBloc>().add(AuthenticationLogoutPressed());
      },
    );
  }
}

class _UserId extends StatelessWidget {
  const _UserId();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) =>
            const Text('Edit Profile'));
  }
}
