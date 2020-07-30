import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FirstRow extends StatelessWidget {
  final String profilePicture;
  FirstRow({this.profilePicture});
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      padding: EdgeInsets.only(left: 5, top: 0, bottom: 3, right: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              child: Container(
                height: 50,
                width: 20,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage(profilePicture))),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Do you have question?",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              margin: EdgeInsets.only(top: 5),
              child: VerticalDivider(),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/forum'),
              child: Column(
                children: <Widget>[
                  Badge(
                    position: BadgePosition.topRight(top: 0, right: 0),
                    badgeContent: Text(
                      "6",
                      style: TextStyle(color: Colors.white),
                    ),
                    badgeColor: Colors.pink,
                    child: IconButton(
                      icon: Icon(Icons.forum),
                      onPressed: () => Navigator.pushNamed(context, '/forum'),
                    ),
                  ),
                  Text(
                    "Forum",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
