import 'package:flutter/material.dart';

class DiscussionForum extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: this.onRefresh,
      child: SafeArea(
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
            actions: <Widget>[
              Container(
                width: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.only(top: 7, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search message",
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.zero,
                child: ListTile(
                  leading: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme,
                    ),
                    child: Icon(Icons.forum),
                  ),
                  dense: true,
                  title: Text(
                    "Autlify Forum",
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
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return ListTile(
                        leading: Container(
                          height: 60,
                          width: 50,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  new AssetImage('assets/images/mesfine.jpg'),
                            ),
                          ),
                        ),
                        title: Text(
                          "Mesfin Tsegaye",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        subtitle: Text(
                          "Hi, are there any ways to do push notification in flutter without using firebase and google service? I can not use them because firebase",
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Theme.of(context).accentColor,
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration.collapsed(
                      hintStyle: Theme.of(context).textTheme.subtitle1,
                      hintText: "Write your message here",
                    ),
                  ),
                ),
                // Text("data"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      color: Theme.of(context).primaryColorLight,
                      icon: Icon(Icons.attach_file),
                      label: Text("File"),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    FlatButton.icon(
                      color: Theme.of(context).primaryColorLight,
                      icon: Icon(Icons.link),
                      label: Text("Link"),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    FlatButton.icon(
                      color: Colors.blue,
                      icon: Icon(Icons.send, color: Colors.white),
                      label: Text(
                        "Send",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
