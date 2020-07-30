import 'package:flutter/material.dart';

class Course {
  List<Map<String, dynamic>> course = [
    {
      "subject": 'Languages',
      "amount": "7989",
      "icon": Icons.assistant_photo,
      "iconColor": Colors.blueGrey
    },
    {
      "subject": 'Mathematics',
      "amount": "989",
      "icon": Icons.functions,
      "iconColor": Colors.blueAccent
    },
    {
      "subject": 'Information and Communication Technology',
      "amount": "989",
      "icon": Icons.mobile_screen_share,
      "iconColor": Colors.green
    },
    {
      "subject": 'Physics',
      "amount": "989",
      "icon": Icons.graphic_eq,
      "iconColor": Colors.purple
    },
    {
      "subject": 'Chemistry',
      "amount": "989",
      "icon": Icons.polymer,
      "iconColor": Colors.blue
    },
    {
      "subject": 'Biology',
      "grade": "2345",
      "icon": Icons.view_carousel,
      "iconColor": Colors.greenAccent
    },
    {
      "subject": 'History',
      "amount": "989",
      "icon": Icons.history,
      "iconColor": Colors.blueAccent
    },
    {
      "subject": 'Geography',
      "amount": "989",
      "icon": Icons.gps_fixed,
      "iconColor": Colors.orange
    },
    {
      "subject": 'Civic and Ethical Education',
      "amount": "989",
      "icon": Icons.map,
      "iconColor": Colors.blueAccent
    },
    {
      "subject": 'Sport',
      "amount": "989",
      "icon": Icons.nature_people,
      "iconColor": Colors.black26
    },
    {
      "subject": 'Technical Drawing',
      "amount": "989",
      "icon": Icons.picture_in_picture,
      "iconColor": Colors.blueAccent
    },
    {
      "subject": 'General Knowledge',
      "amount": "7989",
      "icon": Icons.all_inclusive,
      "iconColor": Colors.blueGrey
    },
  ];

  List<Map<String, dynamic>> getCourses() {
    return course;
  }
}
