import 'package:eesand/data/subject.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Subject subject = Subject();
    List<Map<String, dynamic>> subjects = subject.getSubject();
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 120,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return index == 0
                ? Card(
                    elevation: 0,
                    color: Theme.of(context).primaryColorLight,
                    child: Container(
                      width: 75,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                            image: AssetImage("assets/images/img0.jpg"),
                            fit: BoxFit.cover),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Theme.of(context).buttonColor,
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                          Text(
                            "Add new Course",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () => _goToVideoCourse(
                        index,
                        subjects[index]["subject"],
                        "Video tutorials available",
                        context),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        // side: BorderSide(width: 0.4),
                      ),
                      child: Container(
                        width: 75,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                            image: AssetImage(subjects[index]["img"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              subjects[index]["subject"],
                              textAlign: TextAlign.center,
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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
