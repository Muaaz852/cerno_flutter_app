import 'package:flutter/material.dart';

import 'package:cerno_flutter_app/widgets/backgroun_gradient.dart';

import 'package:cerno_flutter_app/util/fluro_router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height / 9, bottom: 25.0),
            child: Column(
              children: <Widget>[
                _buildLogo(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset('assets/images/logo_variant1_1200dpi.png', scale: 5.5),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildEmailTextFormField(),
          SizedBox(height: 10.0),
          _buildPasswordTextFormField(),
          SizedBox(height: 30.0),
          _buildSignInButton(),
          SizedBox(height: 30.0),
          _buildBottomWidget(),
        ],
      ),
    );
  }

  Widget _buildEmailTextFormField() {
    return TextFormField(
      controller: _emailText,
      enableInteractiveSelection: true,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorText: '',
        errorStyle: TextStyle(
          color: Colors.white70
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey
          )
        ),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0, end: 30.0),
          child: Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
        ),
        hintText: 'Enter email',
        hintStyle: TextStyle(
          color: Colors.white30,
        ),
        labelText: 'EMAIL',
        labelStyle: TextStyle(
          height: 0.8,
          color: Colors.white70,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordTextFormField() {
    return TextFormField(
      controller: _passwordText,
      enableInteractiveSelection: true,
      obscureText: true,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorStyle: TextStyle(
            color: Colors.white70
        ),
        errorText: '',
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey
            )
        ),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0, end: 30.0),
          child: Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
        ),
        // suffixIcon: Padding(
        //   padding: const EdgeInsetsDirectional.only(top: 16.0, bottom: 12.0),
        //   child: InkWell(
        //     child: Text(
        //       'Help',
        //       style: TextStyle(color: Colors.white54),
        //     ),
        //     onTap: _helpPassword
        //   ),
        // ),
        hintText: 'Enter password',
        hintStyle: TextStyle(
          color: Colors.white30,
        ),
        labelText: 'PASSWORD',
        labelStyle: TextStyle(
          height: 0.8,
          color: Colors.white70,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }

  Widget _buildSignInButton() {
    return !_isLoading ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          highlightedBorderColor: Colors.grey,
          borderSide: BorderSide(
            color: Colors.white70,
          ),
          padding: const EdgeInsets.all(22.0),
          color: Colors.transparent,
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          onPressed: _signIn
        )
      ),
    ) : Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'DON\'T HAVE AN ACCOUNT?',
              style: TextStyle(color: Colors.white30),
            ),
            SizedBox(width: 8.0),
            InkWell(
              child: Text(
                'SIGN UP',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: _signUp
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Forgot Password? ',
              style: TextStyle(color: Colors.white30),
            ),
            SizedBox(width: 8.0),
            InkWell(
                child: Text(
                  'Click Here',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: _navigateToForgotPassword
            )
          ],
        ),
      ],
    );
  }

  Widget _buildSnackbar(String message) {
    return SnackBar(
      content: Text(message),
    );
  }

  void _navigateToForgotPassword() {
    print('Forgot Password Pressed!');
    // Navigator.of(context).pushNamed('/ForgotPassword');
    FluroRouter.router.navigateTo(context, '/ForgotPassword');
  }
  void _signUp() {
    print('Sign Up Pressed!');
    FluroRouter.router.navigateTo(context, "/SignUp"); 
    }

  void _signIn() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 1000)).then((_) {
      setState(() {
        if (_emailText.text.isEmpty && _passwordText.text.isEmpty) {
          _scaffoldKey.currentState.showSnackBar(_buildSnackbar('Successfully Signed In'));
          Future.delayed(const Duration(milliseconds: 1000)).then((_) {
            // Navigator.of(context).pushNamed('/SignInSuccess');
            FluroRouter.router.navigateTo(context, '/SignInSuccess');
          });
          _isLoading = false;
          return;
        }
        if (!_formKey.currentState.validate()) {
          _isLoading = false;
          return;
        }
        _scaffoldKey.currentState.showSnackBar(_buildSnackbar('Successfully Signed In'));
        // Navigator.of(context).pushNamed('/SignInSuccess');
        FluroRouter.router.navigateTo(context, '/SignInSuccess');
        _isLoading = false;
      });
    });
    print('Sign In Pressed!');
  }

  void _helpPassword() {
    print('Help Pressed!');
  }
}
