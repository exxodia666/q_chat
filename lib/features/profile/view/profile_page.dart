import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/features/profile/bloc/profile_bloc.dart';
import 'package:q_chat/features/profile/repositories/profile_repository.dart';
import 'package:q_chat/shared/utils/navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
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
      child: const Text('Edit'),
      onPressed: () {
        navigateTo(context, Routes.editProfile);
      },
    );
  }
}

class _UserId extends StatelessWidget {
  const _UserId();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) => Column(
              children: [
                Text('ID: ${state.user?.id}'),
                Text('Email: ${state.user?.email}'),
                Text('Username: ${state.user?.username}')
              ],
            ));
  }
}
