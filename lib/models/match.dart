// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

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

class MatchStream {
  final String name;
  final String url;

  MatchStream.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class MatchVod {
  final String name;
  final String url;

  MatchVod.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
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

class Match {
  final MatchTournament tournament;
  final MatchMatch match;
  final String date;
  final String time;
  final List<MatchStream> streams;
  final List<MatchVod> vods;
  final MatchScore score;
  final List<MatchTeam> teams;

  Match.fromJson(Map<String, dynamic> json)
      : tournament = MatchTournament.fromJson(json['tournament']),
        match = MatchMatch.fromJson(json['match']),
        date = json['date'],
        time = json['time'],
        streams = List<MatchStream>.from(
            json['streams'].map((model) => MatchStream.fromJson(model))),
        vods = List<MatchVod>.from(
            json['vods'].map((model) => MatchVod.fromJson(model))),
        score = MatchScore.fromJson(json['score']),
        teams = List<MatchTeam>.from(
            json['teams'].map((model) => MatchTeam.fromJson(model)));
}
