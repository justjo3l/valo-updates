// ignore_for_file: no_logic_in_create_state, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/full_match.dart';

import 'map_page.dart';

class MatchPage extends StatefulWidget {
  final int index;

  const MatchPage({Key? key, required this.index}) : super(key: key);

  @override
  _MatchPageState createState() => _MatchPageState(index: index);
}

class _MatchPageState extends State<MatchPage> {
  late Future<FullMatch> futureMatch;
  final int index;

  _MatchPageState({required this.index});

  @override
  void initState() {
    super.initState();
    futureMatch = fetchMatch();
  }

  Future<FullMatch> fetchMatch() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1:5000/match/' + (index + 1).toString() + '/full'));

    if (response.statusCode == 200) {
      FullMatch match = FullMatch.fromJson(jsonDecode(response.body)['data']);
      return match;
    } else {
      throw Exception('Failed to load Match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FullMatch>(
        future: futureMatch,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: FittedBox(
                  child: Text(
                    snapshot.data!.teams.first.name +
                        " vs " +
                        snapshot.data!.teams.last.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  fit: BoxFit.fitWidth,
                ),
                centerTitle: true,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.abc),
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data!.match.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                snapshot.data!.date,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data!.match.type,
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                snapshot.data!.time,
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.right,
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    snapshot.data!.teams.first.name,
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  snapshot.data!.score.team1,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            width: (MediaQuery.of(context).size.width) / 2.5,
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
                            width: (MediaQuery.of(context).size.width) / 5,
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    snapshot.data!.teams.last.name,
                                    style: const TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(
                                  snapshot.data!.score.team2,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            width: (MediaQuery.of(context).size.width) / 2.5,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: snapshot.data!.maps.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              child: Center(
                                child: Padding(
                                  child: SizedBox(
                                    child: Text(snapshot.data!.maps
                                        .elementAt(index)
                                        .name),
                                  ),
                                  padding: const EdgeInsets.only(bottom: 60),
                                ),
                              ),
                              onTap: () {
                                print('Pushed to Map');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapPage(
                                          data: snapshot.data!, index: index)),
                                );
                              },
                            );
                          },
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
