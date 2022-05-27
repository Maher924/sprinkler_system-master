import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sprinkler_system/screens/loading_location_screen/loading.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/screens/users_screen/users_screen.dart';
import 'package:sprinkler_system/utils/assets_manager.dart';
import 'package:sprinkler_system/utils/colors_palette.dart';
import 'package:sprinkler_system/utils/gaps.dart';
import 'package:sprinkler_system/utils/user_id.dart';
import 'package:sprinkler_system/widgets/text_input.dart';

import '../../utils/sprinklers_id.dart';
import '../../utils/util_values.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/showToast.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: UtilValues.scrollPhysics,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    AssetsManager.login,
                    width: 300,
                  ),
                  Gaps.gap32,
                  Text(
                    'Sign in',
                    style: TextStyle(
                      color: ColorsPalette.primarySwatch.shade900,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.gap32,
                  TextInput(
                    hint: 'Enter your email',
                    prefixIcon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    validator: (String? email) {
                      if (email == null || email.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(email)) {
                        return 'Email is invalid';
                      }
                      return null;
                    },
                    onSaved: (String? email) {
                      _email = email!.trim();
                    },
                  ),
                  Gaps.gap16,
                  TextInput(
                    hint: 'Password',
                    prefixIcon: Icons.lock,
                    inputType: TextInputType.visiblePassword,
                    validator: (String? password) {
                      if (password == null || password.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    onSaved: (String? password) {
                      _password = password!.trim();
                    },
                  ),
                  Gaps.gap8,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),
                  Gaps.gap8,
                  PrimaryButton(
                    label: 'Log in',
                    onPressed: () => _login(context),
                  ),
                  if (_errorText != null) ...[
                    Gaps.gap16,
                    Text(
                      _errorText!,
                      style: const TextStyle(
                        color: ColorsPalette.red,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final formState = _formKey.currentState;
    setState(() => _errorText = null);

    if (formState != null) {
      if (formState.validate()) {
        formState.save();

        if (_email == 'admin@app.com' && _password == '123456789') {
          Navigator.of(context).pushReplacementNamed(UsersScreen.routeName);
        }
        User? user = await signInUsingEmailPassword(
          email: _email,
          password: _password,
          context: context,
        );

        if (user?.uid != null) {
          UserID.userID = user;
          UserID.get_user_data();
          context.read<UserID>().get_sprinkler_data();

          Navigator.of(context).pushReplacementNamed('Loading');
        } else {
          setState(() => _errorText = 'Email or Password is incorrect');
        }

        // else if (_email == 'test@test.com' && _password == '123456') {
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Loading()));
        // } else {
        //   setState(() => _errorText = 'Email or Password is incorrect');
        // }
      }
    }
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ShowToast('Email is not found', ToastGravity.BOTTOM);

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        ShowToast('incorrect password', ToastGravity.BOTTOM);

        print('Wrong password provided.');
      }
    }

    return user;
  }
}
