import 'dart:convert';
// import 'dart:developer';

import 'package:gamify/live/footballmodel.dart';
import 'package:http/http.dart' as http;

class FootballApi {
  //endpointd URL
  final String apiUrl =
      'https://v3.football.api-sports.io/fixtures?season=2022&league=39';
  // static String api_Key = "95b2f73dd73e0e12a5eb4d51b3d47af8";

  var headers = {
    // 'x-apisports-key': '3e8e2ffc781fd9aa993acc64f3cfb4eb',
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': '3e8e2ffc781fd9aa993acc64f3cfb4eb',
  };

  Future<List<FootballMatch>> getAllMatches() async {
    http.Response res = await http.get(Uri.parse(apiUrl), headers: headers);
    String body = res.body;

    if (res.statusCode == 200) {
      // debugger();
      //this mean that we are connected to the data base
      Map data = jsonDecode(body);
      List<dynamic> matchesList = data['response'];
      print('Api service: ${matchesList}');
      // List<FootballMatch> matches = data['response'];
      // debugger();
      List<FootballMatch> matches = matchesList
          .map((dynamic item) => FootballMatch.fromJson(item))
          .toList();

      // print('Api service : ${matches}');
//
      return matches;
    } else {
      print('hello');
      throw Exception('Error accessing API');
    }
  }

  // Future<FootballMatch> getAllMatches() async {
  //   var request = http.Request('GET', Uri.parse(apiUrl));
  //   // var request = http.Request(
  //   //     'GET',
  //   //     Uri.parse(
  //   //         'https://v3.football.api-sports.io/fixtures?season=2022&league=39'));
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     final responseData = await response.stream.bytesToString();
  //     // print(1);
  //     // print(responseData);
  //     return FootballMatch.fromJson(jsonDecode(responseData));
  //   } else {
  //     print(response.reasonPhrase);
  //     throw Exception('Failed to load album');
  //   }
  // }
}
