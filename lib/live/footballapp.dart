import 'dart:convert';
import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamify/live/footballmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class FootballApp extends StatefulWidget {
  const FootballApp({super.key});

  @override
  State<FootballApp> createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
var data;
var response;
var fixture;
  var headers = {
    'x-apisports-key': '3e8e2ffc781fd9aa993acc64f3cfb4eb',
    // 'x-rapidapi-host': "v3.football.api-sports.io",
    // 'x-rapidapi-key': '95b2f73dd73e0e12a5eb4d51b3d47af8',
  };
  Future<void>  getAllMatches() async {
      
    final res = await http.get(Uri.parse( 'https://v3.football.api-sports.io/fixtures?season=2022&league=39'), headers: headers,);
   
    if (res.statusCode == 200) {
      
     
      data = jsonDecode(res.body.toString());
      debugger();
      response = data["response"];
     
      
      
      

        
    } else {
     data = jsonDecode(res.body.toString());

    }
  }

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
        future: getAllMatches(),
        // here we will build the app layout
        builder: ( context,  snapshot) {

            if(snapshot.connectionState == ConnectionState.waiting){
              return Text('Loading');
            }else {
           
              return
              ListView.builder(
                itemCount: response.toString().length,
              
                itemBuilder: (context, index) {
                
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text(response[index]["fixture"]["id"].toString()),
                          Text(response[index]["fixture"]["date"].toString()),
                          Text(response[index]["fixture"]["status"].toString()),
                          Text(response[index]["fixture"]["referee"].toString()),
// SvgPicture.network(response[index]["league"]["flag"].toString(),fit: BoxFit.scaleDown,),
                        ],
                      ),),
                  );
                } );
              // Container(
              //     child: Text(fixture["id"].toString()),
              //   );
              
            }
        }
      ),
    );
  }
}
