import 'package:eesand/data/sampleVideos.dart';
import 'package:eesand/shared/bottomSnackbar.dart';
import 'package:eesand/shared/read_more.dart';
import 'package:eesand/widgets/modules/myCourse/CourseOutline.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final Map<String, dynamic> arg;
  CourseDetail({this.arg});

  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SampleVideos list = SampleVideos();
    List<Map<String, dynamic>> video = list.getSampleVideo();
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
        body: RefreshIndicator(
          onRefresh: this.onRefresh,
          child: Container(
            color: Theme.of(context).primaryColorLight,
            child: ListView.builder(
              itemCount: video.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return index == 0
                    ? _toolbar(width, video, index, context, arg)
                    : _unvisitedVideos(width, height, video, index, context);
              },
            ),
          ),
        ),
      ),
    );
  }

  _playVideo(String title, String subtitle, String url, BuildContext context) {
    Map<String, dynamic> data = {
      "subject": title,
      "subtitle": subtitle,
      "url": url
    };
    Navigator.pushNamed(context, '/video-player', arguments: data);
  }

  Widget _unvisitedVideos(double width, double height,
      List<Map<String, dynamic>> video, int index, BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.only(bottom: 3, top: 3),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.playlist_add_check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: ListTile(
                    onTap: () => _settingBottomSnackbar(video[index]["title"],
                        video[index]["subtitle"], context),
                    dense: true,
                    title: Text(
                      video[index]["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      video[index]["subtitle"],
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: IconButton(
                    icon: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: Theme.of(context).colorScheme,
                      ),
                      child: Icon(Icons.more_horiz),
                    ),
                    onPressed: () => _settingBottomSnackbar(
                        video[index]["title"],
                        video[index]["subtitle"],
                        context),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5, right: 10),
            child: ReadMoreText(
              video[index]["description"],
              trimLines: 2,
              colorClickableText: Colors.grey,
              trimMode: TrimMode.Line,
              trimCollapsedText: '... Show more',
              trimExpandedText: '  Show less',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          InkWell(
            onTap: () => _playVideo(video[index]["title"],
                video[index]["subtitle"], video[index]["sources"], context),
            child: Container(
              width: width,
              height: 250,
              margin: EdgeInsets.only(left: 0, right: 0, bottom: 5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(video[index]["img"]),
                      fit: BoxFit.cover)),
              child: IconButton(
                icon: CircleAvatar(
                  backgroundColor: Theme.of(context).buttonColor,
                  child: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                onPressed: () => _playVideo(video[index]["title"],
                    video[index]["subtitle"], video[index]["sources"], context),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("23641 views"),
                Text("2341 Downloads"),
              ],
            ),
          ),
          Divider(indent: 10, endIndent: 10),
          _primaryButtons(width, height, video, index, context),
        ],
      ),
    );
  }

  Widget _toolbar(double width, List<Map<String, dynamic>> video, int index,
      BuildContext context, Map<String, dynamic> arg) {
    return Container(
      margin: EdgeInsets.only(bottom: 3),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        dense: true,
        title: Text(
          "Course outline",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          "${arg["subject"]}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: IconButton(
            onPressed: () => _courseOutlineSnackbar(context, arg),
            icon: Icon(Icons.list),
          ),
        ),
      ),
    );
  }

  Widget _primaryButtons(double width, double height,
      List<Map<String, dynamic>> video, int index, BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton.icon(
            color: Theme.of(context).scaffoldBackgroundColor,
            icon: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(Icons.play_arrow),
            ),
            label: Text(
              "Play",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            onPressed: () => _playVideo(video[index]["title"],
                video[index]["subtitle"], video[index]["sources"], context),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
          FlatButton.icon(
            color: Theme.of(context).scaffoldBackgroundColor,
            icon: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: Icon(Icons.playlist_add),
            ),
            label: Text(
              "Save",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            onPressed: () {},
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
          FlatButton.icon(
            color: Theme.of(context).scaffoldBackgroundColor,
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

  void _settingBottomSnackbar(String title, String subtitle, context) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BottomSnackbar(
            title: title,
            subtitle: subtitle,
          );
        });
  }

  void _courseOutlineSnackbar(BuildContext context, Map<String, dynamic> arg) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return CourseOutline(
            arg: arg,
          );
        });
  }
}
