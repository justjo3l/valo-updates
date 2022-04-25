import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/news.dart';
import 'widgets/news_tile.dart';

Future<List<News>> fetchNews() async {
  final response =
      await http.get(Uri.parse('https://vlrggapi.herokuapp.com/news'));

  if (response.statusCode == 200) {
    print(jsonDecode(response.body)['data']['segments'][0]);
    Iterable l = jsonDecode(response.body)['data']['segments'];
    List<News> news = List<News>.from(l.map((model) => News.fromJson(model)));
    return news;
  } else {
    throw Exception('Failed to load News');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Updates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data'),
        ),
        body: Center(
          child: FutureBuilder<List<News>>(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsTile(
                        title: snapshot.data!.elementAt(index).title,
                        description:
                            snapshot.data!.elementAt(index).description,
                        date: snapshot.data!.elementAt(index).date,
                        author: snapshot.data!.elementAt(index).author,
                        url_path: snapshot.data!.elementAt(index).url_path,
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
      ),
    );
  }
}
