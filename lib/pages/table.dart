import 'package:flutter/material.dart';
import 'package:mysample/lecture_sample.dart';
import 'package:mysample/model/lecture_model.dart';
import 'package:mysample/pages/lecture/lecture_page.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  static List<LectureModel> tileList = sample;

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

  void updateList(String value) {
    setState(() {
      var intValue = int.tryParse(value);

      if (intValue == null) {
        tileList = sample
            .where((element) =>
                element.lectureName.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        tileList = sample
            .where((element) => element.lectureNumber
                .toString()
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
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
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.12,
          minChildSize: 0.1,
          builder: (context, scrollController) => Material(
            color: Colors.amber,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    width: 30,
                    height: 5,
                  ),
                ),
                TextField(
                  onChanged: (value) => updateList(value),
                  decoration: const InputDecoration(
                    hintText: 'Search lecture',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: tileList[index].isCompulsory
                            ? Colors.red
                            : Colors.blue,
                      ),
                      title: Text(
                        '${tileList[index].lectureName} (${tileList[index].year})',
                      ),
                      subtitle: Text(
                        tileList[index].lectureNumber.toString(),
                      ),
                      trailing: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.favorite_border),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LecturePage(tileList[index]),
                          )),
                    ),
                    itemCount: tileList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _addTimetableItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String selectedDay = daysOfWeek[0];
        String selectedTimeRange = timeRanges[0];
        TextEditingController textEditingController = TextEditingController();

        return AlertDialog(
          title: Text('Add Timetable Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: selectedDay,
                items: daysOfWeek.map((day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDay = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedTimeRange,
                items: timeRanges.map((range) {
                  return DropdownMenuItem<String>(
                    value: range,
                    child: Text(range),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTimeRange = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: 'Timetable Item',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final item = textEditingController.text;
                if (item.isNotEmpty) {
                  setState(() {
                    if (!timetableData.containsKey(selectedDay)) {
                      timetableData[selectedDay] = {};
                    }
                    timetableData[selectedDay]![selectedTimeRange] = item;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
