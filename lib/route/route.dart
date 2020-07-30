import 'package:eesand/route/constants.dart';
import 'package:eesand/widgets/RootWidget.dart';
import 'package:eesand/widgets/modules/Home.dart';
import 'package:eesand/widgets/modules/books/BookList.dart';
import 'package:eesand/widgets/modules/forum/Forum.dart';
import 'package:eesand/widgets/modules/myCourse/ActiveClassRoom.dart';
import 'package:eesand/widgets/modules/myCourse/CourseDetail.dart';
import 'package:eesand/widgets/modules/school/School.dart';
import 'package:eesand/widgets/modules/settings/Settings.dart';
import 'package:eesand/widgets/modules/user/Profile.dart';
import 'package:eesand/widgets/modules/user/Signin.dart';
import 'package:eesand/widgets/modules/video/Video.dart';
import 'package:eesand/widgets/modules/video/VideoList.dart';
import 'package:eesand/widgets/modules/video/VideoPlayer.dart';
import 'package:eesand/widgets/pages/NotFoundPage.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case root:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => RootWidget());

    case home:
      return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => Home(),
      );
    case school:
      return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => School(),
      );

    case video:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => Videos());
    case videoCourse:
      var arg = settings.arguments;
      return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => VideoList(
          arg: arg,
        ),
      );
    case videoPlayer:
      var arg = settings.arguments;
      return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => CustomVideoPlayer(
          arg: arg,
        ),
      );
    case phone:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => Signin());

    case profile:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => UserProfile());
    case setting:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => Setting());

    case bookList:
      var arg = settings.arguments;
      return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => BookList(
          arg: arg,
        ),
      );
    case forum:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => DiscussionForum());
    case activeClassRoom:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => ActiveClassRoom());
    case courseDetail:
      var arg = settings.arguments;
      return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => CourseDetail(arg: arg),
      );

    default:
      return PageRouteBuilder(pageBuilder: (_, a1, a2) => NotFound());
  }
}
