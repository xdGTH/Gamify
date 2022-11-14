import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:gamify/live/footballmodel.dart';

import 'api_manager.dart';
import 'package:http/http.dart' as http;

import 'pagerbody.dart';

class FootballApp extends StatefulWidget {
  const FootballApp({super.key});

  @override
  State<FootballApp> createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
  List? _matches;
  getLlive() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://v3.football.api-sports.io/fixtures?season=2022&league=39'),
        headers: {
          'x-rapidapi-host': "v3.football.api-sports.io",
          'x-rapidapi-key': '3e8e2ffc781fd9aa993acc64f3cfb4eb',
        });
    String body = response.body;
    Map data = jsonDecode(body);
    List matches = data['response'];
    setState(() {
      _matches = matches;
    });
  }

  Widget buildList() {
    List<Widget> matches = [];
    for (var match in _matches ?? []) {
      var homeLogo = match['teams']['home']['logo'].toString();
      var awayLogo = match['teams']['away']['logo'].toString();
      var lastThreeHome = homeLogo.substring(homeLogo.length - 3);
      var lastThreeAway = awayLogo.substring(awayLogo.length - 3);
      matches.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  lastThreeHome == 'png'
                      ? Image.network(
                          match['teams']['home']['logo'],
                          height: 60,
                          width: 60,
                        )
                      : SvgPicture.network(
                          match['teams']['home']['logo'],
                          height: 60,
                          width: 60,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    match['teams']['home']['name'].toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        match['fixture']['status']['elapsed'].toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      const Text(
                        "'",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        match['goals']['home'].toString(),
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      const Text(
                        "  -  ",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      Text(
                        match['goals']['away'].toString(),
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  lastThreeAway == 'png'
                      ? Image.network(
                          match['teams']['away']['logo'],
                          height: 60,
                          width: 60,
                        )
                      : SvgPicture.network(
                          match['teams']['away']['logo'],
                          height: 60,
                          width: 60,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    match['teams']['away']['name'].toString(),
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: matches,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLlive();
  }

  @override
  Widget build(BuildContext context) {
    return _matches == null
        ? Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFFe70066),
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.deepOrange[600],
            appBar: AppBar(
              // backgroundColor: const Color(0xffafafafa),
              elevation: 0.0,
              title: const Text(
                "Scoreboard",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: ListView(
              physics: const ClampingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                buildList(),
              ],
            ),
            // body: FutureBuilder(
            //   //here we call our getData() method,
            //   future: FootballApi().getAllMatches(),
            //   // here we will build the app layout
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       print(1);
            //       return PageBody(snapshot.data!);
            //     } else if (snapshot.hasError) {
            //       // print('${snapshot.error}');
            //       return Center(
            //         child: Text('${snapshot.error}'),
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
          );
  }
}
