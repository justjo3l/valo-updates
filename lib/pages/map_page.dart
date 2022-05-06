import 'package:app/widgets/map_table.dart';
import 'package:flutter/material.dart';

import '../models/match.dart';

import '../widgets/map_table.dart';

class MapPage extends StatefulWidget {
  final Match data;
  final int index;

  MapPage({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  _MapPageState createState() => _MapPageState(data: data, index: index);
}

class _MapPageState extends State<MapPage> {
  final Match data;
  final int index;

  _MapPageState({required this.data, required this.index});

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
            "Map " + (index + 1).toString() + " - " + data.maps[index].name,
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
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Row(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          data.teams.first.name,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          data.maps[index].score.team1,
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
                          data.maps[index].score.team2,
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
            MapTable(data: data.maps[index].team1),
            MapTable(data: data.maps[index].team2),
          ],
        ),
      ),
    );
  }
}
