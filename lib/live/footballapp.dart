import 'package:flutter/material.dart';
import 'package:gamify/live/footballmodel.dart';

import 'api_manager.dart';
import 'pagerbody.dart';

class FootballApp extends StatefulWidget {
  const FootballApp({super.key});

  @override
  State<FootballApp> createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffafafafa),
      appBar: AppBar(
        backgroundColor: const Color(0xffafafafa),
        elevation: 0.0,
        title: const Text(
          "Scoreboard",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        //here we call our getData() method,
        future: FootballApi().getAllMatches(),
        // here we will build the app layout
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(1);
            return PageBody(snapshot.data as List<FootballMatch>);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
