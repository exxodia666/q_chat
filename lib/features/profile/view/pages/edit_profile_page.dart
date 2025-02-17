import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_chat/features/authentication/authentication.dart';
import 'package:q_chat/features/profile/view/widgets/edit_profile_form.dart';

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
          // mainAxisSize: MainAxisSize.min,
          children: [EditProfileForm()],
        ),
      ),
    );
  }
}
