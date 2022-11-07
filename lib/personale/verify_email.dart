import 'package:flutter/material.dart';
import 'package:gamify/routes/routes.dart';
import 'package:gamify/services/auth/auth_services.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Verify email')),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "We've sent you an email verification. Please open it to verify your account.",
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "If you haven't recieved a verification email yet, press the button below",
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 90,
          ),
          Expanded(
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    AuthService.firebase().sendEmailVerification();
                  },
                  child: const Text('Send email verification'),
                ),
                TextButton(
                  onPressed: () async {
                    AuthService.firebase().logOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      registerRoute,
                      (route) => false,
                    );
                  },
                  child: const Text('Restart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
