import 'dart:convert';

class FootballMatch {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  FootballMatch(this.fixture, this.home, this.away, this.goal);

  factory FootballMatch.fromJson(Map<String, dynamic> json) {
    return FootballMatch(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.formJson(json['goals']),
    );
  }
  
}

class Fixture {
  int id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date'], Status.fromJson(json['status']));
  }
}

class Status {
  int elapsedTime;
  String long;
  Status(this.elapsedTime, this.long);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'], json['long']);
  }
}

//team data
class Team {
  int id;
  String name;
  String logoUrl;
  bool winner;
  Team(this.id, this.name, this.logoUrl, this.winner);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logoUrl'], json['winner']);
  }
}

class Goal {
  int home;
  int away;
  Goal(this.home, this.away);

  factory Goal.formJson(Map<String, dynamic> json) {
    return Goal(json['home'], json['away']);
  }
}
List<FootballMatch> matchfromjson(String str) =>
    List<FootballMatch>.from(json.decode(str).map((x) => FootballMatch.fromJson(x)));

String matchtojson(List<FootballMatch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.fixture)));
