import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class TableScreen extends StatefulWidget {
  final String code;

  const TableScreen({Key? key, required this.code}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List? _table;

  getTable() async {
    http.Response response = await http.get(
        Uri.parse(
            'http://api.football-data.org/v4/competitions/${widget.code}/standings'),
        headers: {'X-Auth-Token': '208076ed78ad403abd282ae55f6bf580'});
    String body = response.body;
    Map data = jsonDecode(body);
    List table = data['standings'][0]['table'];
    setState(() {
      _table = table;
    });
  }

  Widget buildTable() {
    List<Widget> teams = [];
    for (var team in _table ?? []) {
      var crestUrl = team['team']['crest'].toString();
      //to get last three letters of crestUrl string
      var lastThree = crestUrl.substring(crestUrl.length - 3);
      teams.add(
        Padding(
          //padding from left top right and bottom
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    //to check if the integer is one digits or more to align them in same line
                    team['position'].toString().length > 1
                        ? Text(team['position'].toString() + ' - ')
                        : Text(" " + team['position'].toString() + ' - '),
                    Row(
                      children: [
                        //checking if the lastThree letters are png or not as there were two types of extensions
                        lastThree == 'png'
                            ? Image.network(
                                team['team']['crest'],
                                height: 30,
                                width: 30,
                              )
                            : SvgPicture.network(
                                team['team']['crest'],
                                height: 30,
                                width: 30,
                              ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          //using short name if the name of team is long
                          child: team['team']['name'].toString().length > 11
                              ? Text(team['team']['shortName'].toString())
                              : Text(team['team']['name'].toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(team['playedGames'].toString()),
                    Text(team['won'].toString()),
                    Text(team['draw'].toString()),
                    Text(team['lost'].toString()),
                    Text(team['goalDifference'].toString()),
                    Text(team['points'].toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: teams,
    );
  }

  @override
  void initState() {
    super.initState();
    getTable();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return _table == null
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
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(141, 88, 80, 221),
                    Color.fromARGB(255, 203, 91, 140),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  // clamps two gradient together
                  tileMode: TileMode.clamp,
                ),
              ),
              child: ListView(
                //providing the clamping overscroll behaviour found on Android
                physics: const ClampingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Text(
                                'Pos',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Club',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'PL',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'W',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'D',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'L',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'GD',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Pts',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTable(),
                ],
              ),
            ),
          );
  }
}
