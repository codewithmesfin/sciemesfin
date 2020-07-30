import 'package:flutter/material.dart';

class CourseOutline extends StatelessWidget {
  final Map<String, dynamic> arg;
  CourseOutline({this.arg});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.85,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColorDark,
            child: ListTile(
              dense: true,
              title: Text("${arg["subject"]}"),
              subtitle: Text("${arg["subtitile"]}"),
              trailing: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: .5,
                indent: 0,
                color: Color(0xFFDDDDDD),
              ),
              itemCount: 10,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  dense: true,
                  leading: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.cloud),
                    ),
                  ),
                  title: Text(
                    "Limit and Continuity",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    "Revision on sequence and series",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
