import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/basic_match.dart';

import '../widgets/match_tile.dart';

Future<List<BasicMatch>> fetchMatch() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:5000/matches/10'));

  if (response.statusCode == 200) {
    Iterable l = jsonDecode(response.body)['data'];
    List<BasicMatch> matches =
        List<BasicMatch>.from(l.map((model) => BasicMatch.fromJson(model)));
    return matches;
  } else {
    throw Exception('Failed to load Match');
  }
}

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  late Future<List<BasicMatch>> futureMatch;
  late String currentDate = "";

  @override
  void initState() {
    super.initState();
    futureMatch = fetchMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: Center(
        child: FutureBuilder<List<BasicMatch>>(
          future: futureMatch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MatchTile(
                      teams: snapshot.data!.elementAt(index).teams,
                      score: snapshot.data!.elementAt(index).score,
                      data: snapshot.data!.elementAt(index),
                      index: index,
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
