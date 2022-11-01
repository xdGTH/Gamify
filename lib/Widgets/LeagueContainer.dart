import 'package:flutter/material.dart';

class LeagueContainer extends StatelessWidget {
  final String image;

  const LeagueContainer({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(image),
    );
  }
}
