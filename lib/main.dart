import 'package:chat_app/pages/home/home_page.dart';
import 'package:chat_app/pages/ingredients/ingredients_page.dart';
import 'package:chat_app/pages/login/login_page.dart';
import 'package:chat_app/pages/registration/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Itim'),
      routes: {
        HomePage.routeName: HomePage.pageBuilder,
        LoginPage.routeName: LoginPage.pageBuilder,
        RegistrationPage.routeName: RegistrationPage.pageBuilder,
        IngredientsPage.routeName: IngredientsPage.pageBuilder,
      },
    );
  }
}
