import 'package:flutter/material.dart';

import '../models/match.dart';

import 'map_page.dart';

class MatchPage extends StatefulWidget {
  final Match data;

  MatchPage({Key? key, required this.data}) : super(key: key);

  @override
  _MatchPageState createState() => _MatchPageState(data: data);
}

class _MatchPageState extends State<MatchPage> {
  final Match data;

  _MatchPageState({required this.data});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            data.teams.first.name + " vs " + data.teams.last.name,
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
                        data.match.name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        data.date,
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
                        data.match.type,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        data.time,
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
                            data.teams.first.name,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          data.score.team1,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
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
                            data.teams.last.name,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          data.score.team2,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
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
                  itemCount: data.maps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Center(
                        child: Padding(
                          child: SizedBox(
                            child: Text(data.maps.elementAt(index).name),
                          ),
                          padding: EdgeInsets.only(bottom: 60),
                        ),
                      ),
                      onTap: () {
                        print('Pushed to Map');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapPage(data: data, index: index)),
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
  }
}
