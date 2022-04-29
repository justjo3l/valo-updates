// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../models/match.dart';

class MatchTile extends StatelessWidget {
  final List<MatchTeam> teams;
  final MatchScore score;

  MatchTile({
    Key? key,
    required this.teams,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      teams.first.name,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      score.team1,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                width: (MediaQuery.of(context).size.width) / 3,
              ),
              SizedBox(
                child: Column(
                  children: const [
                    Text(
                      'vs',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ':',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                width: (MediaQuery.of(context).size.width) / 3,
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      teams.last.name,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      score.team2,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                width: (MediaQuery.of(context).size.width) / 3,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
