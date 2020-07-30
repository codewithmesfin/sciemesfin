import 'package:eesand/data/sampleVideos.dart';
import 'package:eesand/widgets/modules/default/FirstRow.dart';
import 'package:eesand/widgets/modules/default/HorizontalList.dart';
import 'package:eesand/widgets/modules/default/SecondRow.dart';
import 'package:eesand/widgets/modules/default/Thumbnails.dart';
import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  @override
  Widget build(BuildContext context) {
    SampleVideos list = SampleVideos();
    List<Map<String, dynamic>> resource = list.getSampleVideo();
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: this.onRefresh,
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: ListView.builder(
          itemCount: resource.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Column(
              children: [
                index == 0
                    ? Column(
                        children: <Widget>[
                          FirstRow(
                            profilePicture: 'assets/images/mesfine.jpg',
                          ),
                          SecondRow(),
                          Container(
                            color: Theme.of(context).primaryColorLight,
                            height: 4,
                            margin: EdgeInsets.only(top: 2),
                          ),
                          HorizontalList(),
                          Container(
                            color: Theme.of(context).primaryColorLight,
                            padding: EdgeInsets.only(bottom: 1, top: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: Theme.of(context).buttonColor,
                                  child: Text(
                                    " My class room ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => Navigator.pushNamed(
                                      context, "/active-class-room"),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                ),
                              ],
                            ),
                            width: width,
                          ),
                        ],
                      )
                    : Container(),
                Thumbnails(
                    title: resource[index]["title"],
                    subtitle: resource[index]["subtitle"],
                    icon: Icons.playlist_add_check,
                    image: resource[index]["img"],
                    desc: resource[index]["description"],
                    source: resource[index]["sources"]),
              ],
            );
          },
        ),
      ),
    );
  }
}
