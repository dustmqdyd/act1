import 'package:flutter/material.dart';
import 'package:mysample/lecture_sample.dart';
import 'package:mysample/model/lecture_model.dart';
import 'package:mysample/timetable.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  double _sheetSize = 0.17;
  static List<LectureModel> tileList = sample;
  bool _isSheetVisible = false;

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
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      '2023 - Spring Semester',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    TimeTable(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isSheetVisible = true;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add lecture'),
            ),
          ),
        ),
        if (_isSheetVisible)
          DraggableScrollableSheet(
            initialChildSize: _sheetSize,
            minChildSize: 0.17,
            maxChildSize: 0.8,
            builder: (context, scrollController) => Material(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: GestureDetector(
                          onVerticalDragUpdate: (details) {
                            setState(() {
                              _sheetSize -= details.delta.dy /
                                  MediaQuery.of(context).size.height;
                              _sheetSize = _sheetSize.clamp(0.17, 0.8);
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.drag_handle,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isSheetVisible = false;
                            });
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
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
                    child: ListView.separated(
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

                        //Need to change
                        onTap: () => {},
                      ),
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[700],
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
}
