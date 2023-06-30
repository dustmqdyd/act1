import 'package:flutter/material.dart';

import 'package:mysample/model/lecture_model.dart';
import 'package:mysample/pages/lecture/lecture_page.dart';
import 'package:mysample/lecture_sample.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<LectureModel> tileList = sample;

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

  void updateList(String value) {
    setState(() {
      var intValue = int.tryParse(value);

      if (intValue == null) {
        tileList = sample
            .where((element) =>
                element.lectureName.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        tileList =
            sample.where((element) => element.lectureNumber.toString().toLowerCase().contains(value.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverPadding(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   sliver: SliverAppBar(
        //     title: SearchAnchor.bar(
        //       barHintText: 'Search lectures',
        //       suggestionsBuilder: (context, controller) =>
        //           getSuggestions(controller),
        //     ),
        //     clipBehavior: Clip.none,
        //   ),
        // ),
        SliverToBoxAdapter(
          child: TextField(
            onChanged: (value) => updateList(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    tileList[index].isCompulsory ? Colors.red : Colors.blue,
              ),
              title: Text(
                '${tileList[index].lectureName} (${tileList[index].year})',
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
