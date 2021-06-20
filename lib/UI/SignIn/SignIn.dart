import 'package:flutter/material.dart';
import 'package:glaucoma_app/CustomWidget/CustomNafigatorText.dart';
import 'package:glaucoma_app/CustomWidget/CustomTextField.dart';
import 'package:glaucoma_app/CustomWidget/customButton.dart';
import 'package:glaucoma_app/CustomWidget/logoWithHeader.dart';
import 'package:glaucoma_app/CustomWidget/validator.dart';
import 'package:glaucoma_app/Provider/App_provider.dart';
import 'package:glaucoma_app/UI/HeroSection/heroSection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget with TextValidators {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

//focus
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _updateState() {
    setState(() {});
  }

  bool _submitted = false;
  void _submit() {
    //send email & password
    try {
      context
          .read<AppProvider>()
          .login(_emailController.text, _passwordController.text, context);
      print(_emailController.text);
      print(_passwordController.text);
      //for validation

      setState(() {
        if (_formkey.currentState.validate()) {
          _submitted = true;
          return;
        }
      });
    } catch (e) {
      print(e.message);
    }
  }

  List<Widget> _buildChildren() {
    return [
      CustomTextField(
        text: "Email",
        placeholder: "Your Email",
        icon: Icons.email,
        inputType: TextInputType.emailAddress,
        Controller: _emailController,
        actionChanging: (email) => _updateState(),
        focusNode: _emailFocusNode,
        EditingComplete: _emailEditingComplete,
        errorMsg: emailErrorText ? widget.invalidEmailErrorText : null,
        validator: (String value) {
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Please Enter a valid Email';
          }
          return null;
        },
      ),
      SizedBox(
        height: 26,
      ),
      CustomTextField(
        text: "Password",
        placeholder: "Type Password",
        icon: Icons.lock,
        inputType: TextInputType.text,
        Controller: _passwordController,
        actionChanging: (password) => _updateState(),
        focusNode: _passwordFocusNode,
        errorMsg: passwordErrorText ? widget.invalidPasswordErrorText : null,
        validator: (String value) {
          if (value.length < 8) {
            return 'Password can\'t be less than 8 char';
          }
          return null;
        },
      ),
      SizedBox(
        height: 26,
      ),
      Row(
        children: <Widget>[
          Text('Forgot Your Password? '),
          CustomNavigatorText(
            text: "Click here",
            navigatorScreen: "hero",
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
    ];
  }

  final _formkey = GlobalKey<FormState>();
  bool firstNameErrorText;
  bool lastNameErrorText;
  bool emailErrorText;
  bool passwordErrorText;

  @override
  Widget build(BuildContext context) {
    bool submitEnable = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);
    emailErrorText = _submitted && !widget.emailValidator.isValid(_email);
    passwordErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LogoWithHeader(),
            Form(
              key: _formkey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Log In",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: _buildChildren(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            text: "Sign In",
                            action: submitEnable ? _submit : null),
                        SizedBox(
                          height: 20,
                        ),
                        CustomNavigatorText(
                          text: "Does not  have an account? Sign up here",
                          navigatorScreen: "signUp",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
