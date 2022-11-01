import 'dart:convert';

import 'package:gamify/live/footballmodel.dart';
import 'package:http/http.dart';

class FootballApi {
  //endpointd URL
  final String apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';
  // static String api_Key = "95b2f73dd73e0e12a5eb4d51b3d47af8";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': '95b2f73dd73e0e12a5eb4d51b3d47af8',
  };

  Future<List<FootballMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      //this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      // print('Api service: ${body}');
      List<FootballMatch> matches = matchesList
          .map((dynamic item) => FootballMatch.fromJson(item))
          .toList();

      return matches;
    } else {
      throw Error();
    }
  }
}
