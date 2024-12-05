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
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    TextConstants.welcomeText,
                    style: TextStyles.introTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    TextConstants.loginEmailText,
                    style: TextStyles.textFieldStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      obscureText: false,
                      hintText: TextConstants.email,
                      onChange: (value) {
                        context
                            .read<LoginBloc>()
                            .add(OnEmailChanged(email: value));
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    TextConstants.enterPassword,
                    style: TextStyles.textFieldStyle,
                  ),
                  CustomTextField(
                    obscureText: true,
                    hintText: TextConstants.password,
                    onChange: (value) {
                      context
                          .read<LoginBloc>()
                          .add(OnPasswordChanged(password: value));
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButtonWidget(
                    data: TextConstants.login,
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted());
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
                    child: Text(
                      'Create account',
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
