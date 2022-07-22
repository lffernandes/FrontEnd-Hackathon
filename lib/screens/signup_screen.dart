import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_reclame_ja/screens/signin_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/colors_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _userNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _userPhoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _RepasswordTextController = TextEditingController();
  final confirmationCodeController = TextEditingController();

  String _signUpError = "";
  bool _isSignedUp = false;

  @override
  void initState() {
    super.initState();
  }

  void _signUp() async {
    setState(() {
      _signUpError = "";
    });

    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: _emailTextController.text,
      CognitoUserAttributeKey.phoneNumber: _userPhoneTextController.text,
    };
    try {
      await Amplify.Auth.signUp(
          username: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      setState(() {
        _isSignedUp = true;
      });
    } on AuthException catch (error) {
      _setError(error);
    }
  }

  void _confirmSignUp() async {
    setState(() {
      _signUpError = "";
    });

    try {
      await Amplify.Auth.confirmSignUp(
          username: _emailTextController.text.trim(),
          confirmationCode: confirmationCodeController.text.trim());
      Navigator.pop(context, true);
    } on AuthException catch (error) {
      _setError(error);
    }
  }

  void _setError(AuthException error) {
    setState(() {
      _signUpError = error.message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringtoColor("845EC2"),
            hexStringtoColor("D65DB1"),
            hexStringtoColor("845EC2")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.email_outlined, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Phone", Icons.phone_enabled_outlined,
                    false, _userPhoneTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Confirm Password", Icons.lock_outlined, true,
                    _RepasswordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  // FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: _emailTextController.text,
                  //         password: _passwordTextController.text)
                  //     .then((value) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => HomeScreen()));
                  // }).onError((error, stackTrace) {
                  //   print("Error ${error.toString()}");
                  // });
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignInScreen(),
                          type: PageTransitionType.bottomToTop));
                }),
              ],
            ),
          ))),
    );
  }
}
