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

class MatchMapScore {
  final String team1;
  final String team2;
  final String team1_attack;
  final String team2_attack;
  final String team1_defend;
  final String team2_defend;

  MatchMapScore.fromJson(Map<String, dynamic> json)
      : team1 = json['team1'],
        team2 = json['team2'],
        team1_attack = json['team1_attack'],
        team2_attack = json['team2_attack'],
        team1_defend = json['team1_defend'],
        team2_defend = json['team2_defend'];

  Map<String, dynamic> toJson() => {
        'team1': team1,
        'team2': team2,
        'team1_attack': team1_attack,
        'team2_attack': team2_attack,
        'team1_defend': team1_defend,
        'team2_defend': team2_defend,
      };
}

class MatchPlayer {
  final String name;
  final String agent;
  final String acs;
  final String k;
  final String d;
  final String a;
  final String kda_difference;
  final String kast;
  final String adr;
  final String hs;
  final String fk;
  final String fd;
  final String fk_difference;

  MatchPlayer.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        agent = json['agent'],
        acs = json['ACS'],
        k = json['K'],
        d = json['D'],
        a = json['A'],
        kda_difference = json['KDA_difference'],
        kast = json['KAST'],
        adr = json['ADR'],
        hs = json['HS%'],
        fk = json['FK'],
        fd = json['FD'],
        fk_difference = json['FK_difference'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'agent': agent,
        'ACS': acs,
        'K': k,
        'D': d,
        'A': a,
        'KDA_difference': kda_difference,
        'KAST': kast,
        'ADR': adr,
        'HS%': hs,
        'FK': fk,
        'FD': fd,
        'FK_difference': fk_difference,
      };
}

class MatchMap {
  final String name;
  final String time_played;
  final MatchMapScore score;
  final List<MatchPlayer> team1;
  final List<MatchPlayer> team2;

  MatchMap.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        time_played = json['time_played'],
        score = MatchMapScore.fromJson(json['score']),
        team1 = List<MatchPlayer>.from(json['players']['team1']
            .map((model) => MatchPlayer.fromJson(model))),
        team2 = List<MatchPlayer>.from(json['players']['team2']
            .map((model) => MatchPlayer.fromJson(model)));

  Map<String, dynamic> toJson() => {
        'name': name,
        'time_played': time_played,
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
  final List<MatchMap> maps;

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
            json['teams'].map((model) => MatchTeam.fromJson(model))),
        maps = List<MatchMap>.from(
            json['maps'].map((model) => MatchMap.fromJson(model)));
}
