import 'package:eesand/data/sampleVideos.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  final Map<String, dynamic> arg;
  BookList({this.arg});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SampleVideos list = SampleVideos();
    List<Map<String, dynamic>> book = list.getSampleVideo();
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
            arg["subject"],
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext ctxt, int index) {
            return index == 0
                ? ListTile(
                    dense: true,
                    title: Text(
                      "234 Books",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    subtitle: Text(
                      arg["subject"],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    trailing: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        color: Colors.indigo,
                      ),
                      label: Text(
                        "Sort by",
                        style: TextStyle(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  )
                : _bookList(width, height, book, index, context);
          },
        ),
      ),
    );
  }

  Widget _bookList(double width, double height, List<Map<String, dynamic>> book,
      int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColorLight,
            height: 10,
            margin: EdgeInsets.only(top: 10, bottom: 10),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Card(
                    elevation: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 7),
                      height: height * 0.13,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(book[index]["img"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  isThreeLine: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
                  title: Text(
                    book[index]["title"],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  subtitle: Text(
                    book[index]["description"],
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
          _optionButtons(context),
        ],
      ),
    );
  }

  _optionButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(Icons.playlist_add),
            ),
          ),
          FlatButton.icon(
            color: Theme.of(context).accentColor,
            icon: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(Icons.clear_all),
            ),
            label: Text(
              "Read",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            onPressed: () {},
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
          FlatButton.icon(
            color: Theme.of(context).accentColor,
            icon: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(Icons.file_download),
            ),
            label: Text(
              "Download",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            onPressed: () {},
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}
