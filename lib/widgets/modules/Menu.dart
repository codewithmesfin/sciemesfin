import 'package:eesand/bloc/phone_no/phone_no_provider.dart';
import 'package:eesand/state/app-state-notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menus extends StatefulWidget {
  @override
  _MenusState createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    final _bloc = PhoneNoBlocProvider.of(context);
    return RefreshIndicator(
      onRefresh: this.onRefresh,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              dense: true,
              leading: Container(
                height: 70,
                width: 45,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/images/mesfine.jpg'))),
              ),
              title: Text(
                "Mesfin Tsegaye",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text(
                "View your profile",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            ListTile(
              dense: true,
              leading: Card(
                color: Colors.green,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                "Grade 12 A",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Container(
                height: 25,
                child: RaisedButton(
                  color: Colors.pink,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  child: Text("22", style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.video_library,
                color: Colors.green,
              ),
              title: Text(
                "Video tutorials",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.library_books,
                color: Colors.orange,
              ),
              title: Text(
                "Books",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.note, color: Colors.blue[300]),
              title: Text(
                "Notes",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.question_answer,
                color: Colors.blue,
              ),
              title: Text(
                "Question bank",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.people,
                color: Colors.pink,
              ),
              title: Text(
                "Team",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.save,
                color: Colors.blue,
              ),
              title: Text(
                "Saved",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.brightness_2,
                color: Colors.grey,
              ),
              title: Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Switch(
                value: Provider.of<AppStateNotifier>(context).isDarkModeOn,
                onChanged: (boolVal) {
                  Provider.of<AppStateNotifier>(context).updateTheme(boolVal);
                },
                activeTrackColor: Colors.grey,
                activeColor: Colors.black,
                inactiveThumbColor: Colors.blue,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.assistant_photo,
                color: Colors.green,
              ),
              title: Text(
                "Language",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.help,
                color: Colors.grey,
              ),
              title: Text(
                "Help",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.brightness_auto,
                color: Colors.grey,
              ),
              title: Text(
                "About",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.grey,
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () => _bloc
                  .signOut()
                  .then((value) => Navigator.pushNamed(context, '/')),
            ),
          ],
        ),
      ),
    );
  }
}
