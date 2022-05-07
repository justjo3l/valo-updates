import 'package:flutter/material.dart';

import '../models/full_match.dart';

class MapTable extends StatelessWidget {
  final List<MatchPlayer> data;

  const MapTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const {
          0: FlexColumnWidth(2),
        },
        children: [
          const TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(
                    'Kills',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(
                    'Deaths',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(
                    'Assists',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(
                    'KDA',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Text(
                    data[0].name,
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[0].k),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[0].d),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[0].a),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[0].kda_difference),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Text(
                    data[1].name,
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[1].k),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[1].d),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[1].a),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[1].kda_difference),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Text(
                    data[2].name,
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[2].k),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[2].d),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[2].a),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[2].kda_difference),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Text(
                    data[3].name,
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[3].k),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[3].d),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[3].a),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[3].kda_difference),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Center(
                  child: Text(
                    data[4].name,
                  ),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[4].k),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[4].d),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[4].a),
                ),
              ),
              TableCell(
                child: Center(
                  child: Text(data[4].kda_difference),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
