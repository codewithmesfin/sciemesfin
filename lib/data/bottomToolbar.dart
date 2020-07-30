import 'package:flutter/material.dart';

class BottomToolbar {
  List<Map<String, dynamic>> data = [
    {
      "title": "Recommended Note",
      "subtitle": "A short note extracted from different books",
      "icon": Icons.note
    },
    {
      "title": "Supportive videos",
      "subtitle": "Watch additional videos on this topic",
      "icon": Icons.switch_video
    },
    {
      "title": "Advanced Information",
      "subtitle": "Read more on this topic and adance your knowledge",
      "icon": Icons.label_important
    },
    {
      "title": "Activities",
      "subtitle":
          "You will be shown diferent experimental or real activies on this topic",
      "icon": Icons.local_bar
    },
    {
      "title": "Worked Examples",
      "subtitle": "Get unlimited examples with their diverse solutions ",
      "icon": Icons.functions
    },
    {
      "title": "Exam Questions",
      "subtitle": "Exams questions and their detailed solutions",
      "icon": Icons.help
    },
    {
      "title": "Your Assessment",
      "subtitle": "Take activities on this topic to get assessed by Autlify",
      "icon": Icons.verified_user
    },
  ];

  List<Map<String, dynamic>> getData() {
    return data;
  }
}
