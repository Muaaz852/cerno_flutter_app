import 'package:fluro/fluro.dart';

import 'package:flutter/widgets.dart';

import 'package:cerno_flutter_app/pages/sign_up.dart';
import 'package:cerno_flutter_app/pages/login.dart';
import 'package:cerno_flutter_app/pages/login_success.dart';
import 'package:cerno_flutter_app/pages/forgot_password.dart';

Handler signUpHandler = Handler (
  handlerFunc: (BuildContext context, _) {
    return SignUpPage();
  }
);

Handler signInHandler = Handler (
  handlerFunc: (BuildContext context, _) {
    return LoginPage();
  }
);

Handler forgotPasswordHandler = Handler (
  handlerFunc: (BuildContext context, _) {
    return ForgotPasswordPage();
  }
);

Handler signInSuccessHandler = Handler (
  handlerFunc: (BuildContext context, _) {
    return LoginSuccessPage();
  }
);