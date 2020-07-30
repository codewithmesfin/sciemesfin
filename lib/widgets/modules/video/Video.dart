import 'package:eesand/data/course.dart';
import 'package:flutter/material.dart';

class Videos extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Course list = Course();
    List<Map<String, dynamic>> course = list.getCourses();
    return Container(
      height: height,
      child: RefreshIndicator(
        onRefresh: this.onRefresh,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: .5,
            indent: 75,
            color: Color(0xFFDDDDDD),
          ),
          itemCount: course.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              dense: true,
              leading: CircleAvatar(
                  backgroundColor: course[index]["iconColor"],
                  child: Icon(course[index]["icon"], color: Colors.white)),
              title: Text(
                course[index]["subject"],
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                (1210 + index).toString() + " Video tutorials available",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                ),
                child: IconButton(
                  onPressed: () {
                    _goToVideoCourse(index, course[index]["subject"],
                        "Video tutorials available", context);
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              onTap: () {
                _goToVideoCourse(index, course[index]["subject"],
                    "Video tutorials available", context);
              },
            );
          },
        ),
      ),
    );
  }

  _goToVideoCourse(int id, String subject, String subTitle, context) {
    Map<String, dynamic> data = {
      "id": id,
      "subject": subject,
      "subtitile": subTitle
    };
    Navigator.pushNamed(context, "/video-course", arguments: data);
  }
}
