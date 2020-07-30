import 'package:eesand/data/course.dart';
import 'package:flutter/material.dart';

class ActiveClassRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Course list = Course();
    List<Map<String, dynamic>> course = list.getCourses();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          leading: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.chevron_left),
            ),
          ),
          title: Text(
            "My class room",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              dense: true,
              title: Text(
                "Progress",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: Container(
                width: 200,
                color: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      color: Colors.blue,
                      child: Text(
                        "50%",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      padding: EdgeInsets.all(1),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                "Assessement Status",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: Text(
                "Good",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  height: .5,
                  indent: 0,
                  color: Color(0xFFDDDDDD),
                ),
                itemCount: course.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return ListTile(
                    dense: true,
                    leading: CircleAvatar(
                        backgroundColor: course[index]["iconColor"],
                        child:
                            Icon(course[index]["icon"], color: Colors.white)),
                    title: Text(
                      course[index]["subject"],
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    subtitle: Text(
                      (120 + index).toString() + " Contents available",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: Theme.of(context).colorScheme,
                      ),
                      child: IconButton(
                        onPressed: () => _goToCourse(
                          index,
                          course[index]["subject"],
                          "Video tutorials available",
                          context,
                        ),
                        icon: Icon(Icons.chevron_right),
                      ),
                    ),
                    onTap: () => _goToCourse(
                      index,
                      course[index]["subject"],
                      "Video tutorials available",
                      context,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _goToCourse(int id, String subject, String subTitle, context) {
    Map<String, dynamic> data = {
      "id": id,
      "subject": subject,
      "subtitile": subTitle
    };
    Navigator.pushNamed(context, "/course-detail", arguments: data);
  }
}
