import 'package:eesand/data/sampleVideos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final Map<String, dynamic> arg;
  CustomVideoPlayer({this.arg});

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Text('refresh');
    });
  }

  //video player
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.arg["url"],
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
            widget.arg["subject"],
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
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minHeight: height * 0.33),
                color: Colors.black,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            _playPauseOverlay(_controller),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.fullscreen,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            VideoProgressIndicator(_controller,
                                allowScrubbing: true),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: video.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return index == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              _videoTitle(),
                              _optionButtons(),
                              Container(
                                color: Theme.of(context).primaryColorLight,
                                height: 10,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                              ),
                              _relatedVideoToolbar(),
                              Divider(),
                            ],
                          )
                        : _playList(width, height, video, index, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _videoTitle() {
    return Container(
      child: ListTile(
        title: Text(
          widget.arg["subject"],
        ),
        subtitle: Text(
          widget.arg["subtitle"],
          style: Theme.of(context).textTheme.bodyText2,
        ),
        trailing: IconButton(
          color: Theme.of(context).accentColor,
          icon: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme,
            ),
            child: Icon(Icons.file_download),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _relatedVideoToolbar() {
    return ListTile(
      dense: true,
      title: Text(
        "Related Videos",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      trailing: Text(
        "19",
        style: TextStyle(
          color: Colors.pink,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _playList(double width, double height,
      List<Map<String, dynamic>> video, int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () => _playVideo(video[index]["title"],
                  video[index]["subtitle"], video[index]["sources"], context),
              child: Card(
                elevation: 0,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  height: height * 0.13,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(video[index]["img"]),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      child: Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                        ),
                      ),
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
              onTap: () => _playVideo(video[index]["title"],
                  video[index]["subtitle"], video[index]["sources"], context),
              contentPadding:
                  EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
              title: Text(
                video[index]["title"],
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                video[index]["description"],
                style: Theme.of(context).textTheme.bodyText1,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton.icon(
          color: Theme.of(context).accentColor,
          icon: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme,
            ),
            child: Icon(Icons.thumb_up),
          ),
          label: Text(
            "453",
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
            child: Icon(Icons.star),
          ),
          label: Text(
            "3",
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
            child: Icon(Icons.comment),
          ),
          label: Text(
            "431",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          onPressed: () {},
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
      ],
    );
  }

  Widget _playPauseOverlay(controller) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: Center(
            child: controller.value.isPlaying
                ? Container()
                : Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });
          },
        ),
      ],
    );
  }

  _playVideo(String title, String subtitle, String url, BuildContext context) {
    print(url);
    Map<String, dynamic> data = {
      "subject": title,
      "subtitle": subtitle,
      "url": url
    };
    Navigator.pushReplacementNamed(context, '/video-player', arguments: data);
  }
}
