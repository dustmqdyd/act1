import 'lecture_model.dart';
import 'lecture_sample.dart';

(List<LectureModel>, int) filter(LectureModel startPoint) {
  List<LectureModel> filtered = [];

  int startYear = startPoint.year;
  int startNumber = startPoint.lectureNumber;
  int startIndex = sample.indexOf(startPoint);

  int year = startYear - 1;
  int lectureNumber = startPoint.followingLecture;

  for (int i = startIndex -1; i > -1; i--) {
    if (sample[i].year == year && sample[i].lectureNumber == lectureNumber) {
      filtered.insert(0, sample[i]);

      year -= 1;
      lectureNumber = sample[i].previousLecture;
    }
  }

  filtered.add(startPoint);
  int initialPage = filtered.length - 1;
  year = startYear + 1;
  lectureNumber = startNumber;

  for (int i = startIndex + 1; i < sample.length; i++) {
    if (sample[i].year == year && sample[i].lectureNumber == lectureNumber) {
      filtered.add(sample[i]);

      year += 1;
      lectureNumber = sample[i].followingLecture;
    }
  }

  for (var elem in filtered) {
    print(elem.lectureNumber);
  }

  return (filtered, initialPage);
}
