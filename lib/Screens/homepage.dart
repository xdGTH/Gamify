import 'package:flutter/material.dart';
import 'package:gamify/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo.shade600,
      body: Center(
        child: Container(
          height: size.height,
          width: size.width,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100),
              Container(
                color: Colors.blueAccent,
                height: 180,
                width: 180,
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Text(
                  'Never miss an update',
                  style: TextStyle(
                    fontSize: 24.0,
                    wordSpacing: 5,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    leaderBoardRoute,
                    // chooseLeagueRoute,
                    // (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.blueAccent,
                    side: const BorderSide(color: Colors.white24, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(234, 70)),
                child: const Text(
                  'Choose a League',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
