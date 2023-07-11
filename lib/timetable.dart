import 'package:flutter/material.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  static var customRow = <TableCell>[
    TableCell(
      child: Padding(
        padding: EdgeInsets.all(20.0),
      ),
    ),
    TableCell(
      child: Padding(
        padding: EdgeInsets.all(20.0),
      ),
    ),
    TableCell(
      child: Padding(
        padding: EdgeInsets.all(20.0),
      ),
    ),
    TableCell(
      child: Padding(
        padding: EdgeInsets.all(20.0),
      ),
    ),
    TableCell(
      child: Padding(
        padding: EdgeInsets.all(20.0),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(
          children: [
            TableCell(
              child: Text(
                'Mon',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Tue',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Wed',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Thu',
                textAlign: TextAlign.center,
              ),
            ),
            TableCell(
              child: Text(
                'Fri',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
        TableRow(
          children: customRow,
        ),
      ],
      border: TableBorder.symmetric(
        inside: const BorderSide(
          color: Colors.grey,
        ),
        outside: const BorderSide(),
      ),
    );
  }
}
