import 'package:flutter/material.dart';
import 'package:gamify/Widgets/LeaguesList.dart';

class ChooseLeague extends StatefulWidget {
  const ChooseLeague({super.key});

  @override
  State<ChooseLeague> createState() => _ChooseLeagueState();
}

class _ChooseLeagueState extends State<ChooseLeague> {
  List<LeagueList> leagues = [
    LeagueList('Premier League', false),
    LeagueList('Ligue 1', false),
    LeagueList('LaLiga', false),
    LeagueList('NOS', false),
    LeagueList('Bundesliga', false),
    LeagueList('Seria', false),
  ];

  static List image = [
    Image.asset('assets/images/pl.png'),
    Image.asset('assets/images/ligue1.png'),
    Image.asset('assets/images/laliga.png'),
    Image.asset('assets/images/nos.png'),
    Image.asset('assets/images/bundesliga.png'),
    Image.asset('assets/images/seria.png'),
  ];

  List<LeagueList> selectedLeagues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose leagues'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: leagues.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: image[index],
              ),
              title: Text(
                leagues[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: leagues[index].isSelected
                  ? const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank,
                    ),
              onTap: () {
                setState(() {
                  leagues[index].isSelected = !leagues[index].isSelected;
                  if (leagues[index].isSelected == true) {
                    selectedLeagues.add(LeagueList(leagues[index].name, true));
                  } else if (leagues[index].isSelected == false) {
                    selectedLeagues.removeWhere(
                        (element) => element.name == leagues[index].name);
                  }
                });
              },
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ChooseLeague(selectedLeagues)),
      //   ),
      // ),
    );
  }
}
