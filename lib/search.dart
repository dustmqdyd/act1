import 'package:flutter/material.dart';

import 'package:mysample/lecture_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<LectureModel> tileList = [
    // Sample lecture models

    LectureModel(2, 1, 'Data Structures', 5111006, true, 3),
    LectureModel(2, 1, 'Computer Architecture', 5111010, true, 3),
    LectureModel(2, 1, 'Object-Oriented Programming', 5111007, false, 3),
    LectureModel(2, 1, 'Linear Algebra', 5111008, false, 3),
    LectureModel(2, 1, 'Preparations of Future Design I', 5111052, false, 1),
    LectureModel(2, 1, 'Fundamental Project Practice', 5111053, false, 2),
    LectureModel(2, 2, 'Principles of Programming Languages', 5111011, true, 3),
    LectureModel(2, 2, 'Algorithms', 511022, true, 3),
    LectureModel(2, 2, 'Systems Programming', 5111012, false, 3),
    LectureModel(2, 2, 'HCI Programming', 5111014, false, 3),
    LectureModel(2, 2, 'Preparations of Future Design II', 5111054, false, 1),
    LectureModel(2, 2, 'Open Source Development Project Practice', 5111070, false, 2),
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
              title: Text(tileList[index].lectureName),
              subtitle: Text(tileList[index].lectureNumber.toString()),
            ),
            childCount: tileList.length,
          ),
        ),
      ],
    );
  }
}
