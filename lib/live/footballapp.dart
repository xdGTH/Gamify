import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:gamify/live/footballmodel.dart';

import 'package:http/http.dart' as http;

class FootballApp extends StatefulWidget {
  const FootballApp({super.key});

  @override
  State<FootballApp> createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
  List? _matches;
  List? _futurematches;
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
    List futurematches = data['response'];
    setState(() {
      _matches = matches;
      _futurematches = futurematches;
    });
  }

  Widget buildList() {
    List<Widget> matches = [];
    List<Widget> futurematches = [];
    for (var match in _matches ?? []) {
      var homeLogo = match['teams']['home']['logo'].toString();
      var awayLogo = match['teams']['away']['logo'].toString();
      var lastThreeHome = homeLogo.substring(homeLogo.length - 3);
      var lastThreeAway = awayLogo.substring(awayLogo.length - 3);
      if (match['fixture']['status']['elapsed'].toString() != 'null' &&
          match['fixture']['status']['elapsed'].toString() != '90') {
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
    }
    return Column(
      children: matches,
    );
  }

  Widget futureList() {
    List<Widget> futurematches = [];
    for (var match in _matches ?? []) {
      var homeLogo = match['teams']['home']['logo'].toString();
      var awayLogo = match['teams']['away']['logo'].toString();
      var lastThreeHome = homeLogo.substring(homeLogo.length - 3);
      var lastThreeAway = awayLogo.substring(awayLogo.length - 3);
      if (match['fixture']['status']['elapsed'].toString() == 'null') {
        futurematches.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(

             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            

              children: [
                Container(
                  height: 150,
                  width: 100,
                  child: Column(
               
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
                ),
               
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children:const [
                    Text(
                      "V.S.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                
                Container(
                  height: 150,
                  width: 100,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
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
                        
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    return Column(
      children: futurematches,
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
                "Matches",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: ListView(
              physics: const ClampingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                buildList(),
                futureList(),
              ],
            ),
          );
  }
}
