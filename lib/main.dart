import 'package:cerno_flutter_app/pages/forgot_password.dart';
import 'package:flutter/material.dart';

import 'package:cerno_flutter_app/pages/login.dart';
import 'package:cerno_flutter_app/pages/login_success.dart';
import 'package:cerno_flutter_app/pages/sign_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerno Flutter App',
      theme: ThemeData(
        textSelectionHandleColor: Colors.white
      ),
      home: LoginPage(),
      routes:  {
        '/SignInSuccess': (BuildContext context) => LoginSuccessPage(),
        '/SignUp': (BuildContext context) => SignUpPage(),
        '/SignIn': (BuildContext context) => LoginPage(),
        '/ForgotPassword': (BuildContext context) => ForgotPasswordPage(),
      },
    );
  }
}
