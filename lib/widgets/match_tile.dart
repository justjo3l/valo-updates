// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

import '../models/basic_match.dart';

import '../pages/match_page.dart';

class MatchTile extends StatelessWidget {
  final List<MatchTeam> teams;
  final BasicMatch data;
  final int index;

  const MatchTile({
    Key? key,
    required this.teams,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
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
                        teams.first.score,
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
                        teams.last.score,
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
            color: Color.fromARGB(255, 1, 1, 1),
          )
        ],
      ),
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('Pushed to Match');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MatchPage(index: index)),
        );
      },
    );
  }
}
