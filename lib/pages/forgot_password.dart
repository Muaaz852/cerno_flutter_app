import 'package:flutter/material.dart';

import 'package:cerno_flutter_app/widgets/backgroun_gradient.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _forgotPasswordText = TextEditingController();

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
                    padding: const EdgeInsets.only(top: 30.0),
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
          _buildForgotEmailTextFormField(),
          SizedBox(height: 15.0),
          _buildSendPasswordResetEmailButton(),
          SizedBox(height: 20.0),
          _buildBottomWidget(),
        ],
      ),
    );
  }

  Widget _buildForgotEmailTextFormField() {
    return TextFormField(
      controller: _forgotPasswordText,
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

  Widget _buildSendPasswordResetEmailButton() {
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
                    'Send Email',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  onPressed: _sendPasswordResetEmail),
            ),
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
          'SIGN IN HERE',
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
    print('Sign In Pressed!');
    Navigator.of(context).pushNamed('/SignIn');
  }

  void _sendPasswordResetEmail() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 1000)).then((_) {
      setState(() {
        if (_forgotPasswordText.text.isEmpty) {
          _scaffoldKey.currentState
              .showSnackBar(_buildSnackBar('Password Reset Email Sent!'));
          _isLoading = false;
          return;
        }
        if (!_formKey.currentState.validate()) {
          _isLoading = false;
          return;
        }
        _scaffoldKey.currentState
            .showSnackBar(_buildSnackBar('Password Reset Email Sent!'));
        _isLoading = false;
      });
    });
    print('Sign In Pressed!');
  }
}
