import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    String subTitle =
        "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator";
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
            "Settings",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: this.onRefresh,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ListTile(
                    title: Text(
                      "Account Setting",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: Icon(Icons.person)),
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text("Personal Information",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  subTitle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: Icon(Icons.security)),
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text("Login and Password",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  subTitle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text("Class Room Setting",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: Icon(Icons.school)),
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text("Eesand 2020 (Active)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  subTitle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: Icon(Icons.history)),
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text("Previous Class Room(s)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  subTitle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text("Your Eesand Information",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: Icon(Icons.info)),
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text("Access your info",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  subTitle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1, child: Icon(Icons.local_activity)),
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text("Activity and Log",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                  subTitle,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
