import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    //  double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
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
            "Profile",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: this.onRefresh,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 130,
                    width: 100,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                new AssetImage('assets/images/mesfine.jpg'))),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Mesfin Tsegaye",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 35,
                          child: FloatingActionButton.extended(
                            onPressed: () {},
                            label: Text("Add Note"),
                            backgroundColor: Colors.blue[900],
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.all(5),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                icon: Icon(Icons.edit), onPressed: null),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.insert_emoticon,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("What is in your mind?"),
                      subtitle: Text(
                        "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.  The passage is attributed to an unknown typesetter in the 15th century",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Not now",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 20),
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.blue[900],
                        child: Text(
                          "Update Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.donut_small),
                    title: Text("Tana Haik Secondary School"),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.donut_small),
                    title: Text("Grade 10th A"),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.gps_fixed),
                    title: Text("Address"),
                    subtitle: Text(
                      "Ehiopia, Amhara, Gojjam, Bahir Dar, Dipo",
                      style: Theme.of(context).textTheme.bodyText2,
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
