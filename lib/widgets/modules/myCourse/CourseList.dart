import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: this.onRefresh,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            ListTile(
              leading: Container(
                width: 50,
                height: height,
                margin: EdgeInsets.all(0),
                child: Card(
                  color: Colors.green,
                  child: Icon(
                    Icons.tap_and_play,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Active Class Rooom',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                'Fourtheen (14) Subjects, Four Category, Free, Intermiediate level',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 55,
                          child: Card(
                            elevation: 5,
                            color: Colors.orange,
                            child: Icon(
                              Icons.layers,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text("Previous Class",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, "/active-class-room"),
                          child: Container(
                            height: 55,
                            width: 55,
                            child: Card(
                              elevation: 5,
                              color: Colors.green,
                              child: Icon(
                                Icons.tap_and_play,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text("Active Class",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    margin: EdgeInsets.all(0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 55,
                          child: Card(
                            elevation: 5,
                            color: Colors.blue[800],
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text("Add Class Room",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              leading: Container(
                width: 50,
                height: height,
                margin: EdgeInsets.all(0),
                child: Card(
                  color: Colors.blue,
                  child: Icon(
                    Icons.flag,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Languages',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "Afaan Oromoo, Amharigna, Tigrigna, English",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Text("4"),
            ),
            Divider(indent: 75),
            ListTile(
              dense: true,
              leading: Container(
                width: 50,
                height: height,
                margin: EdgeInsets.all(0),
                child: Card(
                  color: Colors.pink,
                  child: Icon(
                    Icons.nature,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Natural Science',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "Physics, Chemistry, Biology, Mathematics",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Text("4"),
            ),
            Divider(indent: 75),
            ListTile(
              dense: true,
              leading: Container(
                width: 50,
                height: height,
                margin: EdgeInsets.all(0),
                child: Card(
                  color: Colors.green,
                  child: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Social Science',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "History, Geography, Civics",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Text("3"),
            ),
            Divider(indent: 75),
            ListTile(
              dense: true,
              leading: Container(
                width: 50,
                height: height,
                margin: EdgeInsets.all(0),
                child: Card(
                  color: Colors.orange,
                  child: Icon(
                    Icons.collections,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Others',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "ICT, Technica Drawing, Sport",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Text("3"),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
