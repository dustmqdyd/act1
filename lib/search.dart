import 'package:flutter/material.dart';

import 'package:mysample/lecture_model.dart';
import 'package:mysample/lecture_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<LectureModel> tileList = [
    // Sample lecture models

    LectureModel(2019, 2, 1, 'Data Structures', 5111006, true, 3),
    LectureModel(2019, 2, 1, 'Computer Architecture', 5111010, true, 3),
    LectureModel(2019, 2, 1, 'Object-Oriented Programming', 5111007, false, 3),
    LectureModel(2019, 2, 1, 'Linear Algebra', 5111008, false, 3),
    LectureModel(
        2019, 2, 1, 'Preparations of Future Design I', 5111052, false, 1),
    LectureModel(2019, 2, 1, 'Fundamental Project Practice', 5111053, false, 2),
    LectureModel(
        2019, 2, 2, 'Principles of Programming Languages', 5111011, true, 3),
    LectureModel(2019, 2, 2, 'Algorithms', 511022, true, 3),
    LectureModel(2019, 2, 2, 'Systems Programming', 5111012, false, 3),
    LectureModel(2019, 2, 2, 'HCI Programming', 5111014, false, 3),
    LectureModel(
        2019, 2, 2, 'Preparations of Future Design II', 5111054, false, 1),
    LectureModel(2019, 2, 2, 'Open Source Development Project Practice',
        5111070, false, 2),
    LectureModel(2019, 3, 1, 'Operation Systems', 5111015, true, 3),
    LectureModel(2019, 3, 1, 'Object-Oriented Design', 5111016, true, 3),
    LectureModel(
        2019, 3, 1, 'Web-based Software Development', 5111018, false, 3),
    LectureModel(2019, 3, 1, 'Compiler', 5111023, false, 3),
    LectureModel(2019, 3, 1, 'Computer Networks', 5111025, false, 3),
    LectureModel(
        2019, 3, 1, 'Implementation of Future Design I', 5111056, false, 1),
    LectureModel(2019, 3, 1, 'Open Source Project Application Practice',
        5111071, false, 2),
    LectureModel(2019, 3, 2, 'Software Engineering', 5111024, true, 3),
    LectureModel(2019, 3, 2, 'Interlink Project Practice, Comprehensive Design',
        5111061, true, 2),
    LectureModel(2019, 3, 2, 'Probability and Statistics', 5111013, false, 3),
    LectureModel(2019, 3, 2, 'Database System', 5111026, false, 3),
    LectureModel(2019, 3, 2, 'Computer Graphics', 5111027, false, 3),
    LectureModel(2019, 3, 2, 'Firmware Programming', 5111045, false, 3),
    LectureModel(
        2019, 3, 2, 'Implementation of Future Design II', 5111058, false, 1),
    LectureModel(2019, 3, 2, 'Cloud Computing', 5111072, false, 3),
  ];

  List<LectureModel> tileListList = List.from(tileList);

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;

    return tileList
        .where(
          (element) => element.lectureName.toLowerCase().contains(
                input.toLowerCase(),
              ),
        )
        .map(
          (e) => ListTile(
            title: Text(e.lectureName),
            subtitle: Text(
              e.lectureNumber.toString(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          sliver: SliverAppBar(
            title: SearchAnchor.bar(
              barHintText: 'Search lectures',
              suggestionsBuilder: (context, controller) =>
                  getSuggestions(controller),
            ),
            clipBehavior: Clip.none,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    tileList[index].isCompulsory! ? Colors.red : Colors.blue,
              ),
              title: Text(
                tileList[index].lectureName,
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
            childCount: tileList.length,
          ),
        ),
      ],
    );
  }
}
