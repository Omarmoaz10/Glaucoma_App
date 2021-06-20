import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glaucoma_app/CustomWidget/CustomNafigatorText.dart';
import 'package:glaucoma_app/CustomWidget/CustomTextField.dart';
import 'package:glaucoma_app/CustomWidget/colors.dart';
import 'package:glaucoma_app/CustomWidget/customButton.dart';
import 'package:glaucoma_app/CustomWidget/logoWithHeader.dart';
import 'package:glaucoma_app/CustomWidget/validator.dart';
import 'package:glaucoma_app/Provider/App_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget with TextValidators {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _value = false; //for checkbox true or false
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String get _firstName => _firstNameController.text;
  String get _lastName => _lastNameController.text;
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  String get _confirmPassword => _confirmPasswordController.text;

//focus
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _checkedFocusNode = FocusNode();

  void _firstNameEditingComplete() {
    FocusScope.of(context).requestFocus(_lastNameFocusNode);
  }

  void _lastNameEditingComplete() {
    FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _passwordEditingComplete() {
    FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
  }

  void _confirmPasswordEditingComplete() {
    FocusScope.of(context).requestFocus(_checkedFocusNode);
  }

  void _checkedEditingComplete() {
    FocusScope.of(context).unfocus();
  }

  void _updateState() {
    setState(() {});
  }

  bool _submitted = false;
  //type the code here
  void _submit() {
    //send email & password
    try {
      context.read<AppProvider>().signup(
          f_name: _firstName,
          l_name: _lastName,
          email: _email,
          password: _password,
          context: context);
      print(_firstNameController.text);
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
      Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomTextField(
              text: "Name",
              placeholder: "First Name",
              icon: Icons.person,
              inputType: TextInputType.text,
              Controller: _firstNameController,
              actionChanging: (firstName) => _updateState(),
              focusNode: _firstNameFocusNode,
              EditingComplete: _firstNameEditingComplete,
              errorMsg:
                  firstNameErrorText ? widget.invalidFirstNameErrorText : null,
              validator: (String value) {
                if (value.length < 3) {
                  return 'First name can\'t be less than there char';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 1,
            child: CustomTextField(
              text: "",
              placeholder: "Last Name",
              icon: Icons.person,
              inputType: TextInputType.text,
              Controller: _lastNameController,
              actionChanging: (lastName) => _updateState(),
              focusNode: _lastNameFocusNode,
              EditingComplete: _lastNameEditingComplete,
              errorMsg:
                  lastNameErrorText ? widget.invalidLastNameErrorText : null,
              validator: (String value) {
                if (value.length < 3) {
                  return 'Last name can\'t be less than there char';
                }
                return null;
              },
            ),
          ),
        ],
      ),
      SizedBox(
        height: 26,
      ),
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
        EditingComplete: _passwordEditingComplete,
        errorMsg: passwordErrorText ? widget.invalidPasswordErrorText : null,
        validator: (String value) {
          if (value.length < 2) {
            return 'Password can\'t be less than 8 char';
          }
          return null;
        },
      ),
      CustomTextField(
        text: "",
        placeholder: "Confirm Your Password",
        icon: Icons.lock,
        inputType: TextInputType.text,
        Controller: _confirmPasswordController,
        actionChanging: (confirmPassword) => _updateState(),
        focusNode: _confirmPasswordFocusNode,
        EditingComplete: _confirmPasswordEditingComplete,
        validator: (String value) {
          if (_confirmPassword != _password) {
            return "Does not match the password";
          }
          return null;
        },
      ),
      SizedBox(
        height: 26,
      ),
      FormField<bool>(
        builder: (state) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                      activeColor: SecondaryTextColor,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          state.didChange(value);
                        });
                      }),
                  Expanded(
                      flex: 2, child: Text('Do you agree for all our rules, ')),
                  Expanded(
                    flex: 2,
                    child: CustomNavigatorText(
                      text: "Click here to Show",
                      navigatorScreen: "signIn",
                    ),
                  ),
                ],
              ),
              Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                ),
              )
            ],
          );
        },
        validator: (value) {
          if (!_value) {
            return 'You need to accept terms';
          } else {
            return null;
          }
        },
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
        widget.firstNameValidator.isValid(_firstName) &&
        widget.lastNameValidator.isValid(_lastName) &&
        widget.passwordValidator.isValid(_password) &&
        _value;
    firstNameErrorText =
        _submitted && !widget.firstNameValidator.isValid(_firstName);
    lastNameErrorText =
        _submitted && !widget.lastNameValidator.isValid(_lastName);
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
                          "Create New Account",
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
                          text: "Create New Account",
                          action: submitEnable ? _submit : null,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomNavigatorText(
                          text: "Already have an account? Login here",
                          navigatorScreen: "signIn",
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
