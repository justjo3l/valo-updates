// ignore_for_file: non_constant_identifier_names

class MatchTournament {
  final String name;
  final String url;

  MatchTournament.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class MatchMatch {
  final String name;
  final String type;

  MatchMatch.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
      };
}

class MatchScore {
  final String team1;
  final String team2;

  MatchScore.fromJson(Map<String, dynamic> json)
      : team1 = json['team1'],
        team2 = json['team2'];

  Map<String, dynamic> toJson() => {
        'team1': team1,
        'team2': team2,
      };
}

class MatchTeam {
  final String name;
  final String url;

  MatchTeam.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class BasicMatch {
  final MatchTournament tournament;
  final MatchMatch match;
  final String date;
  final String time;
  final MatchScore score;
  final List<MatchTeam> teams;

  BasicMatch.fromJson(Map<String, dynamic> json)
      : tournament = MatchTournament.fromJson(json['tournament']),
        match = MatchMatch.fromJson(json['match']),
        date = json['date'],
        time = json['time'],
        score = MatchScore.fromJson(json['score']),
        teams = List<MatchTeam>.from(
            json['teams'].map((model) => MatchTeam.fromJson(model)));
}
