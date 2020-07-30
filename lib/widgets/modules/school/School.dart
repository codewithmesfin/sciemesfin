import 'package:flutter/material.dart';

class School extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    //  double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.7,
              padding: EdgeInsets.zero,
            ),
            preferredSize: const Size.fromHeight(0.0),
          ),
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
          title: Text("Services", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: null)
          ],
        ),
        body: RefreshIndicator(
          onRefresh: this.onRefresh,
          child: ListView(
            padding: EdgeInsets.all(5),
            children: [
              ListTile(
                leading: Container(
                  width: 50,
                  height: height,
                  margin: EdgeInsets.all(0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                title: Text(
                  'E E S A N D ',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  'Ethiopian Education Services Automation & Digitalization',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: height,
                    margin: EdgeInsets.all(0),
                    color: Colors.green[400],
                    child: Icon(Icons.video_library, color: Colors.white),
                  ),
                  title: Text('Video Tutorials'),
                  subtitle: Text("1500 Video tutorials available"),
                  trailing:
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: height,
                    margin: EdgeInsets.all(0),
                    color: Colors.greenAccent,
                    child: Icon(Icons.library_books, color: Colors.white),
                  ),
                  title: Text('Text Books'),
                  subtitle: Text("17309 recommended Text Books available"),
                  trailing:
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: height,
                    margin: EdgeInsets.all(0),
                    color: Colors.blue,
                    child: Icon(Icons.show_chart, color: Colors.white),
                  ),
                  title: Text('Reference Books'),
                  subtitle: Text("97892 reference books available"),
                  trailing:
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: height,
                    margin: EdgeInsets.all(0),
                    color: Colors.lightBlueAccent,
                    child: Icon(Icons.short_text, color: Colors.white),
                  ),
                  title: Text('Short Notes'),
                  subtitle: Text("3000 Short Note sheets available"),
                  trailing:
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: height,
                    margin: EdgeInsets.all(0),
                    color: Colors.orange,
                    child: Icon(Icons.question_answer, color: Colors.white),
                  ),
                  title: Text('Natiobal Exam sheets'),
                  subtitle: Text("5620 National exam sheets available"),
                  trailing:
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: height,
                    margin: EdgeInsets.all(0),
                    color: Colors.purple[200],
                    child: Icon(Icons.line_style, color: Colors.white),
                  ),
                  title: Text('Worksheets'),
                  subtitle: Text("1500 different worksheets available"),
                  trailing:
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
