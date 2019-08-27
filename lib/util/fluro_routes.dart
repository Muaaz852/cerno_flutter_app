
import 'package:fluro/fluro.dart';

import 'package:cerno_flutter_app/util/fluro_handler.dart';

class Routes {
  static String signUpURL = "/SignUp";
  static String signInURL = "/SignIn";
  static String forgotPasswordURL = "/ForgotPassword";
  static String signInSuccess = "/SignInSuccess";

  static void configureRoutes(Router router) {
    
    router.define(signUpURL, handler: signUpHandler, transitionType: TransitionType.fadeIn);
    
    router.define(signInURL, handler: signInHandler, transitionType: TransitionType.fadeIn);

    router.define(forgotPasswordURL, handler: forgotPasswordHandler, transitionType: TransitionType.fadeIn);

    router.define(signInSuccess, handler: signInSuccessHandler, transitionType: TransitionType.fadeIn);
  }
}