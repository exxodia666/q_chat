import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_chat/core/constants/routes.dart';
import 'package:q_chat/shared/bloc/user_bloc.dart';
import 'package:q_chat/shared/theme/colors.dart';
import 'package:q_chat/shared/theme/typography.dart';
import 'package:q_chat/shared/utils/navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const GetUserMe());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _UserId()),
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
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Container(
              width: 140.0,
              height: 140.0,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: CustomColors.primary,
                        shape: BoxShape.circle,
                        // border: Border.all(color: Colors.black),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.person_2,
                      size: 120.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TypographyCustom.medium(text: 'Email '),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 15.0, bottom: 5.0),
                          child: TypographyCustom.medium(
                              color: CustomColors.black,
                              text: state.user.email),
                        ),
                      ),
                    ])),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TypographyCustom.medium(text: 'Username '),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 15.0, bottom: 5.0),
                          child: TypographyCustom.medium(
                              color: CustomColors.black,
                              text: state.user.username ?? ''),
                        ),
                      ),
                    ])),
            // const Spacer(
            //   flex: 1,
            // ),
            const Spacer(flex: 2),
            const _LogoutButton(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
