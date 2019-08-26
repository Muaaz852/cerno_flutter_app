import 'package:flutter/material.dart';

import 'package:cerno_flutter_app/widgets/backgroun_gradient.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  final TextEditingController _confirmPasswordText = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          BackgroundGradient(),
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: screenSize.height / 10, bottom: 25.0),
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
          SizedBox(height: 15.0),
          _buildPasswordTextFormField(),
          SizedBox(
            height: 15.0
          ),
          _buildConfirmPasswordTextFormField(),
          SizedBox(height: 25.0),
          _buildSignUpButton(),
          SizedBox(height: 20.0),
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
        errorStyle: TextStyle(color: Colors.white70),
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
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
        errorStyle: TextStyle(color: Colors.white70),
        errorText: '',
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0, end: 30.0),
          child: Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(top: 16.0, bottom: 12.0),
          child: InkWell(
              child: Text(
                'Help',
                style: TextStyle(color: Colors.white54),
              ),
              onTap: _helpPassword),
        ),
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

  Widget _buildConfirmPasswordTextFormField() {
    return TextFormField(
      controller: _confirmPasswordText,
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
        errorStyle: TextStyle(color: Colors.white70),
        errorText: '',
        focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10.0, end: 30.0),
          child: Icon(
            Icons.lock_outline,
            color: Colors.grey,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(top: 16.0, bottom: 12.0),
          child: InkWell(
              child: Text(
                'Help',
                style: TextStyle(color: Colors.white54),
              ),
              onTap: _helpPassword),
        ),
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
          return 'Please confirm your password';
        }

        if (value != _passwordText.text) {
          return 'Password does not match';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpButton() {
    return !_isLoading
        ? Padding(
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    onPressed: _signUp)),
          )
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
  }

  Widget _buildBottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'ALREADY HAVE AN ACCOUNT?',
          style: TextStyle(color: Colors.white30),
        ),
        SizedBox(width: 8.0),
        InkWell(
            child: Text(
              'SIGN IN',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: _signIn)
      ],
    );
  }

  Widget _buildSnackBar(String message) {
    return SnackBar(
      content: Text(message),
    );
  }

  void _signIn() {
    print('Sign Up Pressed!');
    Navigator.of(context).pushNamed('/SignIn');
  }

  void _signUp() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 1000)).then((_) {
      setState(() {
        if (_emailText.text.isEmpty && _passwordText.text.isEmpty) {
          _scaffoldKey.currentState
              .showSnackBar(_buildSnackBar('Successfully Signed Up'));
          Future.delayed(const Duration(milliseconds: 1000)).then((_) {
            Navigator.of(context).pushNamed('/SignIn');
          });
          _isLoading = false;
          return;
        }
        if (!_formKey.currentState.validate()) {
          _isLoading = false;
          return;
        }
        _scaffoldKey.currentState
            .showSnackBar(_buildSnackBar('Successfully Signed Up'));
        Future.delayed(const Duration(milliseconds: 1000)).then((_) {
          Navigator.of(context).pushNamed('/SignUp');
        });
        _isLoading = false;
      });
    });
    print('Sign In Pressed!');
  }

  void _helpPassword() {
    print('Help Pressed!');
  }
}
