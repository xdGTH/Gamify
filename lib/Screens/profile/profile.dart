import 'package:flutter/material.dart';
import 'info_card.dart';

// our data
const url = "dilashaupadhyay.me";
const email = "dilashaupa@gmail.com";
const phone = "9\86"; // not real number :)
const location = "Nepal";

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Dilasha Upadhyay",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  " Subscribed leagues: \nPremier League, Laliga",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey[200],
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Source Sans Pro"),
                ),
                SizedBox(
                  height: 40,
                  width: 200,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),

                // we will be creating a new widget name info carrd

                // InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),
                // InfoCard(text: url, icon: Icons.web, onPressed: () async {}),
                // InfoCard(
                //     text: location,
                //     icon: Icons.location_city,
                //     onPressed: () async {}),
                // InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
              ],
            ),
          ),
        ));
  }
}
