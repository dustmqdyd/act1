import 'package:flutter/material.dart';

import 'package:mysample/model/lecture_model.dart';
import 'package:mysample/pages/lecture/lecture_professor.dart';

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
                  '| ${widget.lecture.year.toString()} - ${widget.lecture.semester.toString()} |',
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    (index + 1).toString(),
                  ),
                ),
                title: const Text('Prof. '),
                subtitle: const Text('Class '),
                trailing: const Icon(Icons.favorite_border),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LectureProfessor(widget.lecture),
                  ),
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
