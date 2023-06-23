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
                  textAlign: TextAlign.center,
                  maxLines: 2,
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
                          const Text(
                            'Lecture No. ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.lecture.lectureNumber.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Lecture type: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.lecture.isCompulsory ? 'Major' : 'GE',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Credit: ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.lecture.credit.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
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
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.favorite),
                    ),
                    Text('Prof. $index'),
                  ],
                ),
              ),
            ),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
