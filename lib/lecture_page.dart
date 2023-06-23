import 'package:flutter/material.dart';

import 'package:mysample/lecture_info.dart';
import 'package:mysample/lecture_model.dart';
import 'package:mysample/list_filter.dart';

class LecturePage extends StatefulWidget {
  const LecturePage(this.lecture, {super.key});

  final LectureModel lecture;

  @override
  State<LecturePage> createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {
  @override
  Widget build(BuildContext context) {
    List filteredList;
    int initialPage;
    (filteredList, initialPage) = filter(widget.lecture);
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(
            initialPage: initialPage,
          ),
          itemCount: filteredList.length,
          itemBuilder: (context, index) => LectureInfo(filteredList[index]),
        ),
      ),
    );
  }
}
