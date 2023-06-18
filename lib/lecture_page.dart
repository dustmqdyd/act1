import 'package:flutter/material.dart';

import 'package:mysample/lecture_info.dart';
import 'package:mysample/lecture_model.dart';

class LecturePage extends StatefulWidget {
  const LecturePage(this.lecture, {super.key});

  final LectureModel lecture;

  @override
  State<LecturePage> createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            LectureInfo(widget.lecture),
          ],
        ),
      ),
    );
  }
}
