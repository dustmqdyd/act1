import 'package:mysample/model/lecture_model.dart';

List<LectureModel> sample = [
  // Sample lecture models
  // 2019 course

  LectureModel(2019, 2, 1, 'Data Structures', 5111006, true, 3),
  LectureModel(2019, 2, 1, 'Computer Architecture', 5111010, true, 3),
  LectureModel(2019, 2, 1, 'Object-Oriented Programming', 5111007, false, 3),
  LectureModel(2019, 2, 1, 'Linear Algebra', 5111008, false, 3),
  LectureModel(2019, 2, 1, 'Preparations of Future Design I', 5111052, false, 1, 0,
      5111083),
  LectureModel(
      2019, 2, 1, 'Fundamental Project Practice', 5111053, false, 2, 0, 5111084),
  LectureModel(
      2019, 2, 2, 'Principles of Programming Languages', 5111011, true, 3),
  LectureModel(2019, 2, 2, 'Algorithms', 5111022, true, 3),
  LectureModel(2019, 2, 2, 'Systems Programming', 5111012, false, 3),
  LectureModel(2019, 2, 2, 'HCI Programming', 5111014, false, 3),
  LectureModel(2019, 2, 2, 'Preparations of Future Design II', 5111054, false,
      1, 0, 5111086),
  LectureModel(2019, 2, 2, 'Open Source Development Project Practice', 5111070,
      false, 2),

  // 2020 course

  LectureModel(2020, 2, 1, 'Data Structures', 5111006, true, 3),
  LectureModel(2020, 2, 1, 'Computer Architecture', 5111010, true, 3),
  LectureModel(2020, 2, 1, 'English for SW Development', 5111085, false, 2),
  LectureModel(2020, 2, 1, 'Object-Oriented Programming', 5111007, false, 3),
  LectureModel(2020, 2, 1, 'Linear Algebra', 5111008, false, 3),
  LectureModel(
      2020, 2, 1, 'Implementation of Future Design', 5111083, false, 1, 5111052),
  LectureModel(2020, 2, 1, 'Fundamental of Open Source SW Project', 5111084,
      false, 2, 5111053),
  LectureModel(2020, 2, 2, 'Algorithms', 5111022, true, 3),
  LectureModel(
      2020, 2, 2, 'Principles of Programming Languages', 5111011, false, 3),
  LectureModel(2020, 2, 2, 'Systems Programming', 5111012, false, 3),
  LectureModel(2020, 2, 2, 'Start-up Exploration', 5111086, false, 1, 5111054),
  LectureModel(2020, 2, 2, 'Development of Open Source SW Project', 5111070,
      false, 2),
  LectureModel(2020, 2, 2, 'Probability and Statistics', 5111013, false, 3),
  LectureModel(2020, 2, 2, 'Computer Graphics', 5111027, false, 3),

  // 2021 course

  LectureModel(2021, 2, 1, 'Data Structures', 5111006, true, 3, 0, 5118006),
  LectureModel(2021, 2, 1, 'Computer Architecture', 5111010, true, 3, 0, 5118007),
  LectureModel(
      2021, 2, 1, 'English for SW Development', 5111058, false, 2, 0, 5118008),
  LectureModel(
      2021, 2, 1, 'Object-Oriented Programming', 5111007, false, 3, 0, 5118009),
  LectureModel(2021, 2, 1, 'Linear Algebra', 5111008, false, 3, 0, 5118010),
  LectureModel(2021, 2, 1, 'Implementation of Future Design', 5111083, false, 1, 0,
      5118011),
  LectureModel(2021, 2, 1, 'Fundamental of Open Source SW Project', 5111084,
      false, 2, 0, 5118012),
  LectureModel(2021, 2, 2, 'Algorithms', 5111022, true, 3, 0, 5118013),
  LectureModel(2021, 2, 2, 'Principles of Programming Languages', 5111011,
      false, 3, 0, 5118014),
  LectureModel(2021, 2, 2, 'Systems Programming', 5111012, false, 3, 0, 5118015),
  LectureModel(2021, 2, 2, 'Start-up Exploration', 5111086, false, 1, 0, 5118016),
  LectureModel(2021, 2, 2, 'Development of Open Source SW Project', 5111070,
      false, 2, 0, 5118017),
  LectureModel(
      2021, 2, 2, 'Probability and Statistics', 5111013, false, 3, 0, 5118018),
  LectureModel(2021, 2, 2, 'Computer Graphics', 5111027, false, 3, 0, 5118019),

  // 2022 course

  LectureModel(2022, 2, 1, 'Data Structures', 5118006, true, 3, 5111006),
  LectureModel(2022, 2, 1, 'Computer Architecture', 5118007, true, 3, 5111010),
  LectureModel(2022, 2, 1, 'English for SW Development', 5118008, false, 3,5111058),
  LectureModel(2022, 2, 1, 'Object-Oriented Programming', 5118009, false, 3, 5111007),
  LectureModel(2022, 2, 1, 'Linear Algebra', 5118010, false, 3, 5111008),
  LectureModel(
      2022, 2, 1, 'Implementation of Future Design', 5118011, false, 1, 5111083),
  LectureModel(2022, 2, 1, 'Fundamental of Open Source SW Project', 5118012,
      false, 2, 5111084),
  LectureModel(2022, 2, 2, 'Algorithms', 5118013, true, 3, 5111022),
  LectureModel(
      2022, 2, 2, 'Principles of Programming Languages', 5118014, false, 3, 5111011),
  LectureModel(2022, 2, 2, 'System Software', 5118015, false, 3, 5111012),
  LectureModel(2022, 2, 2, 'Start-up Exploration', 5118016, false, 1, 5111086),
  LectureModel(2022, 2, 2, 'Development of Open Source SW Project', 5118017,
      false, 2, 5111070),
  LectureModel(2022, 2, 2, 'Probability and Statistics', 5118018, false, 3, 5111013),
  LectureModel(2022, 2, 2, 'Computer Graphics', 5118019, false, 3, 5111027),
];


  // LectureModel(2019, 3, 1, 'Operation Systems', 5111015, true, 3),
  // LectureModel(2019, 3, 1, 'Object-Oriented Design', 5111016, true, 3),
  // LectureModel(2019, 3, 1, 'Web-based Software Development', 5111018, false, 3),
  // LectureModel(2019, 3, 1, 'Compiler', 5111023, false, 3),
  // LectureModel(2019, 3, 1, 'Computer Networks', 5111025, false, 3),
  // LectureModel(
  //     2019, 3, 1, 'Implementation of Future Design I', 5111056, false, 1),
  // LectureModel(2019, 3, 1, 'Open Source Project Application Practice', 5111071,
  //     false, 2),
  // LectureModel(2019, 3, 2, 'Software Engineering', 5111024, true, 3),
  // LectureModel(2019, 3, 2, 'Interlink Project Practice, Comprehensive Design',
  //     5111061, true, 2),
  // LectureModel(2019, 3, 2, 'Probability and Statistics', 5111013, false, 3),
  // LectureModel(2019, 3, 2, 'Database System', 5111026, false, 3),
  // LectureModel(2019, 3, 2, 'Computer Graphics', 5111027, false, 3),
  // LectureModel(2019, 3, 2, 'Firmware Programming', 5111045, false, 3),
  // LectureModel(
  //     2019, 3, 2, 'Implementation of Future Design II', 5111058, false, 1),
  // LectureModel(2019, 3, 2, 'Cloud Computing', 5111072, false, 3),