import 'package:flutter/material.dart';
import 'package:gamify/Screens/login_signup/login.dart';
import 'package:gamify/Screens/login_signup/register.dart';
import 'package:gamify/Screens/chooseleague.dart';
import 'package:gamify/Screens/leaguescreen.dart';
import 'package:gamify/Screens/homepage.dart';
import 'package:gamify/Screens/login_signup/verify_email.dart';
import 'package:gamify/routes/routes.dart';
import 'package:gamify/not%20linked/mainpage.dart';
import 'package:gamify/services/auth/auth_services.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gamify',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
      routes: {
        homePageRoute: (context) => const HomePage(),
        mainPageRoute: (context) => const MainPage(),
        leaderBoardRoute: (context) => const LeagueScreen(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const MyRegister(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        chooseLeagueRoute: (context) => const ChooseLeague(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const HomePage();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
