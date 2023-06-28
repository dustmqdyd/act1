import 'package:flutter/material.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  final List<String> timeRanges = [
    '9 AM',
    '10 AM',
    '11 PM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
  ];

  Map<String, Map<String, String>> timetableData = {};

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  '2023 - 1st Semester',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // Empty space for time range column
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: const Text('Mon'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: const Text('Tue'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: const Text('Wed'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: const Text('Thu'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  child: const Text('Fri'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: timeRanges.length,
              itemBuilder: (context, index) {
                final timeRange = timeRanges[index];
                return Row(
                  children: [
                    for (var day in daysOfWeek)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: timetableData.containsKey(day) &&
                                  timetableData[day]!.containsKey(timeRange)
                              ? Text(timetableData[day]![timeRange]!)
                              : null,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
