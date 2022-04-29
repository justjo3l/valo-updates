import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/match.dart';

import '../widgets/match_tile.dart';

Future<List<Match>> fetchMatch() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000/match/3'));

  if (response.statusCode == 200) {
    Iterable l = jsonDecode(response.body)['data'];
    List<Match> matches =
        List<Match>.from(l.map((model) => Match.fromJson(model)));
    return matches;
  } else {
    throw Exception('Failed to load Match');
  }
}

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  late Future<List<Match>> futureMatch;

  @override
  void initState() {
    super.initState();
    futureMatch = fetchMatch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data'),
      ),
      body: Center(
        child: FutureBuilder<List<Match>>(
          future: futureMatch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MatchTile(
                      teams: snapshot.data!.elementAt(index).teams,
                      score: snapshot.data!.elementAt(index).score,
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
