import 'package:eesand/shared/bottomSnackbar.dart';
import 'package:eesand/shared/read_more.dart';
import 'package:flutter/material.dart';

class Thumbnails extends StatelessWidget {
  final String image;
  final String title;
  final icon;
  final String subtitle;
  final String desc;
  final String source;
  Thumbnails(
      {this.image,
      this.title,
      this.subtitle,
      this.icon,
      this.desc,
      this.source});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.only(bottom: 3, top: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            onTap: () => _settingBottomSnackbar(title, subtitle, context),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme,
              ),
              child: IconButton(
                onPressed: () =>
                    _settingBottomSnackbar(title, subtitle, context),
                icon: Icon(Icons.more_horiz),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 15, right: 10),
            child: ReadMoreText(
              desc,
              trimLines: 4,
              colorClickableText: Colors.grey,
              trimMode: TrimMode.Line,
              trimCollapsedText: '... Show more',
              trimExpandedText: '  Show less',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            width: width,
            height: 260,
            margin: EdgeInsets.only(left: 0, right: 0, bottom: 5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).buttonColor,
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              onPressed: () => _playVideo(title, subtitle, source, context),
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
          Container(
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
                  onPressed: () => _playVideo(title, subtitle, source, context),
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
          ),
        ],
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
}
