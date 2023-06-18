import 'package:flutter/material.dart';

import 'package:mysample/lecture_model.dart';

class LectureInfo extends StatefulWidget {
  const LectureInfo(this.lecture, {super.key});

  final LectureModel lecture;

  @override
  State<LectureInfo> createState() => _LectureInfoState();
}

class _LectureInfoState extends State<LectureInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.lecture.lectureName,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '(${widget.lecture.year.toString()})',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Lecture No. '),
                          Text(
                            widget.lecture.lectureNumber.toString(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Lecture type: '),
                          Text(
                            widget.lecture.isCompulsory! ? 'Major' : 'GE',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Credit: '),
                          Text(
                            widget.lecture.credit.toString(),
                          ),
                        ],
                      ),
                    ],
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
