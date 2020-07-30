import 'package:flutter/material.dart';

class NotificationClass extends StatelessWidget {
  final List<Map<String, dynamic>> alerts = [
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "unread"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "unread"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "unread"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
    {
      "title": "Sample title",
      "subtitle":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "status": "read"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(Icons.notifications_active),
            ),
            dense: true,
            title: Text(
              "Your Notifications",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            subtitle: Text(
              "Read,write, discuss every thing with everybody you like. Keep it academic.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(height: .5),
            itemCount: alerts.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                color: alerts[index]["status"] == "unread"
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).scaffoldBackgroundColor,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: Icon(
                      Icons.label_important,
                      color: Theme.of(context).buttonColor,
                    ),
                  ),
                  title: Text(
                    "${alerts[index]["title"]} ${(index + 1)}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    "${alerts[index]["subtitle"]}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
