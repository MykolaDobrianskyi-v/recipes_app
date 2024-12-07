import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:chat_app/pages/login/bloc/login_bloc.dart';
import 'package:chat_app/pages/registration/registration_page.dart';
import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:chat_app/widgets/custom_button_widget.dart';
import 'package:chat_app/widgets/custom_text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(auth: FirebaseAuth.instance),
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
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            obscureText: false,
                            hintText: TextConstants.email,
                            onChange: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(OnEmailChanged(email: value));
                            },
                          ),
                          if (!state.isEmailValid)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Invalid email format",
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
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            obscureText: true,
                            hintText: TextConstants.password,
                            onChange: (value) {
                              context
                                  .read<LoginBloc>()
                                  .add(OnPasswordChanged(password: value));
                            },
                          ),
                          if (!state.isPasswordValid)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Password must be at least 6 characters",
                                style: TextStyles.errorTextStyle,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return CustomButtonWidget(
                        data: TextConstants.login,
                        onPressed: state.isEmailValid && state.isPasswordValid
                            ? () {
                                context.read<LoginBloc>().add(LoginSubmitted());
                              }
                            : null,
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Create account',
                      textAlign: TextAlign.center,
                    ),
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
