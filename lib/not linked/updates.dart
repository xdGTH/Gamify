import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Gamify',
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.notifications),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.menu_sharp),
              )),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent.shade100,
                    // onPrimary: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white24, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(400, 200)),
                child: const Text(
                  '',
                  // style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent.shade100,
                    // onPrimary: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white24, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(400, 200)),
                child: const Text(
                  '',
                  // style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent.shade100,
                    // onPrimary: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white24, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(400, 200)),
                child: const Text(
                  '',
                  // style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent.shade100,
                    // onPrimary: Colors.white,
                    elevation: 20,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white24, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: const Size(400, 200)),
                child: const Text(
                  '',
                  // style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        color: Colors.lightBlueAccent.shade100,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {},
        items: const [
          Icon(
            Icons.settings,
          ),
          Icon(Icons.home),
          Icon(Icons.history),
        ],
      ),
    );
  }
}
