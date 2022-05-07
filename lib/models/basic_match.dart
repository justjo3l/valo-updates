// ignore_for_file: non_constant_identifier_names

class MatchTeam {
  final String name;
  final String score;

  MatchTeam.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        score = json['score'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'score': score,
      };
}

class BasicMatch {
  final String tournament;
  final String match;
  final List<MatchTeam> teams;

  BasicMatch.fromJson(Map<String, dynamic> json)
      : tournament = json['tournament'],
        match = json['match'],
        teams = List<MatchTeam>.from(
            json['teams'].map((model) => MatchTeam.fromJson(model)));
}
