import 'package:badges/badges.dart';
import 'package:eesand/widgets/modules/Menu.dart';
import 'package:eesand/widgets/modules/books/Book.dart';
import 'package:eesand/widgets/modules/default/DefaultWidget.dart';
import 'package:eesand/widgets/modules/myCourse/CourseList.dart';
import 'package:eesand/widgets/modules/notification/Notification.dart';
import 'package:eesand/widgets/modules/video/Video.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.4,
            leading: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                icon: Icon(
                  Icons.person_pin,
                ),
              ),
            ),
            actions: <Widget>[
              Container(
                width: width * 0.7,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(top: 7, bottom: 7),
                child: FlatButton.icon(
                  color: Theme.of(context).accentColor,
                  icon: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme,
                    ),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  label: Text(
                    "Search autlify",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/setting',
                  ),
                  icon: Icon(
                    Icons.settings,
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.video_library)),
                Tab(icon: Icon(Icons.library_books)),
                Tab(icon: Icon(Icons.local_library)),
                Tab(
                  icon: Badge(
                      position: BadgePosition.topRight(top: -12, right: -9),
                      badgeContent: Text(
                        "5",
                        style: TextStyle(color: Colors.white),
                      ),
                      badgeColor: Colors.pink,
                      child: Icon(Icons.notifications)),
                ),
                Tab(icon: Icon(Icons.menu)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DefaultWidget(),
              Videos(),
              Books(),
              CourseList(),
              NotificationClass(),
              Menus(),
            ],
          ),
        ),
      ),
    );
  }
}
