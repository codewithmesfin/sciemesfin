import 'package:eesand/data/course.dart';
import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Course list = Course();
    List<Map<String, dynamic>> books = list.getCourses();
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
          itemCount: books.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              dense: true,
              leading: CircleAvatar(
                  backgroundColor: books[index]["iconColor"],
                  child: Icon(books[index]["icon"], color: Colors.white)),
              title: Text(
                books[index]["subject"],
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                (1210 + index).toString() + " books available",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                ),
                child: IconButton(
                  onPressed: () {
                    _goToBookList(index, books[index]["subject"],
                        "Video tutorials available", context);
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              onTap: () {
                _goToBookList(index, books[index]["subject"],
                    "Video tutorials available", context);
              },
            );
          },
        ),
      ),
    );
  }

  _goToBookList(int id, String subject, String subTitle, context) {
    Map<String, dynamic> data = {
      "id": id,
      "subject": subject,
      "subtitile": subTitle
    };
    Navigator.pushNamed(context, "/book-list", arguments: data);
  }
}
