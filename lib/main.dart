import 'package:flutter/material.dart';

import 'pages/news_page.dart';
import 'pages/matches_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Updates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MatchesPage(),
    );
  }
}
