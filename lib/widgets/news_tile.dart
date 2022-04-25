import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String author;
  final String url_path;

  NewsTile({
    required this.title,
    required this.description,
    required this.date,
    required this.author,
    required this.url_path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 30,
              ),
              child: Column(
                children: [
                  Text(
                    "By " + author,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    date,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
