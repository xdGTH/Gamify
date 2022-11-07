// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gamify/Screens/homepage.dart';
import 'package:gamify/routes/routes.dart';
import 'package:gamify/services/auth/auth_exception.dart';
import 'package:gamify/services/auth/auth_services.dart';

import '../utilities/dialogs/error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 115),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Column(children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter your email here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Enter your password here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                            //decoration: TextDecoration.underline,
                            fontSize: 27,
                            color: Color(0xff4c505b),
                            fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;
                            try {
                              await AuthService.firebase().logIn(
                                email: email,
                                password: password,
                              );
                              final user = AuthService.firebase().currentUser;
                              if (user?.isEmailVerified ?? false) {
                                //user's email is verified
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  homePageRoute,
                                  (route) => false,
                                );
                              } else {
                                //user's email is NOT verified
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  verifyEmailRoute,
                                  (route) => false,
                                );
                              }
                            } on UserNotFoundAuthException {
                              await showErrorDialog(
                                context,
                                'User not found',
                              );
                            } on WrongPasswordAuthException {
                              await showErrorDialog(
                                context,
                                'Wrong credentials!',
                              );
                            } on GenericAuthException {
                              await showErrorDialog(
                                context,
                                'Authentication error',
                              );
                            }
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, registerRoute);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 19,
                              color: Color(0xff4c505b),
                            ),
                          )),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
