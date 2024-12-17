import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:chat_app/pages/registration/bloc/registration_bloc.dart';
import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:chat_app/widgets/custom_button_widget.dart';
import 'package:chat_app/widgets/custom_text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  static const String routeName = '/registration';
  static Widget Function(BuildContext) pageBuilder =
      (_) => const RegistrationPage();
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(auth: FirebaseAuth.instance),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    TextConstants.welcomeText,
                    style: TextStyles.introTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    TextConstants.loginEmailText,
                    style: TextStyles.textFieldStyle,
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            obscureText: false,
                            hintText: TextConstants.email,
                            onChange: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(OnEmailChanged(email: value));
                            },
                          ),
                          if (!state.isEmailValid)
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                TextConstants.invalidEmailFormat,
                                style: TextStyles.errorTextStyle,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    TextConstants.enterPassword,
                    style: TextStyles.textFieldStyle,
                  ),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            obscureText: true,
                            hintText: TextConstants.password,
                            onChange: (value) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(OnPasswordChanged(password: value));
                            },
                          ),
                          if (!state.isPasswordValid)
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                TextConstants.invalidPasswordFormat,
                                style: TextStyles.errorTextStyle,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return CustomButtonWidget(
                        data: TextConstants.login,
                        onPressed: state.isEmailValid && state.isPasswordValid
                            ? () {
                                context
                                    .read<RegistrationBloc>()
                                    .add(RegistrationSubmitted());
                              }
                            : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
