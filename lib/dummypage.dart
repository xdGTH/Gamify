import 'package:flutter/material.dart';

class DummyPage1 extends StatefulWidget {
  const DummyPage1({super.key});

  @override
  State<DummyPage1> createState() => _DummyPage1State();
}

class _DummyPage1State extends State<DummyPage1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: (Text('Dummy Pages '))),
    );
  }
}
