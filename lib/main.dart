import 'package:flutter/material.dart';
import 'package:gamify/Gunjan/login.dart';
import 'package:gamify/Gunjan/register.dart';
import 'package:gamify/Screens/chooseleague.dart';
// import 'package:gamify/Screens/datascreen.dart';
import 'package:gamify/Screens/leaguechose.dart';
import 'package:gamify/Gunjan/MainScreen.dart';
// import 'package:gamify/not%20linked/SplashScreen.dart';
import 'package:gamify/Screens/leaguescreen.dart';
import 'package:gamify/Screens/homepage.dart';
// import 'package:gamify/not%20linked/SplashScreen.dart';
import 'package:gamify/routes/routes.dart';
// import 'package:rive/rive.dart';
// import 'package:gamify/not%20linked/mainpage.dart';
// import 'package:flutter/services.dart';
// import 'package:gamify/not%20linked/updates.dart';

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
      // home: SplashScreen.navigate(
      //   name: 'assets/rive/football.riv',
      //   next: (context) => const Home(),
      //   until: () => Future.delayed(const Duration(seconds: 4)),
      //   startAnimation: 'start',
      //   endAnimation: 'end',
      // ),
      home: const Home(),
      // home: MainScreen(),
      routes: {
        homePageRoute: (context) => const HomePage(),
        // updateRoute: (context) => const UpdatePage(),
        // mainPageRoute: (context) => const MainPage(),
        leaderBoardRoute: (context) => const LeagueScreen(),
        loginRoute: (context) => const Mylogin(),
        registerRoute: (context) => const MyRegister(),
        chooseLeagueRoute: (context) => const ChooseLeague(),
        leagueChoseRoute: (context) => const LeagueChose(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
    // return const MyRegister();
    // return const NavBar();
    // return const SplashScreen();
    return MainScreen();
  }
}
