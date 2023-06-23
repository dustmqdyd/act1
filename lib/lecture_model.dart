class LectureModel {
  final int year;
  final int grade;
  final int semester;
  final String lectureName;
  final int lectureNumber;
  final bool isCompulsory;
  final int credit;
  int previousLecture;
  int followingLecture;

  LectureModel(this.year, this.grade, this.semester, this.lectureName,
      this.lectureNumber, this.isCompulsory, this.credit,
      [this.previousLecture = 0, this.followingLecture = 0]) {
    if (previousLecture == 0) {
      previousLecture = lectureNumber;
    }
    if (followingLecture == 0) {
      followingLecture = lectureNumber;
    }
  }
}

// https://www.youtube.com/watch?v=ZSVnIphlGKI