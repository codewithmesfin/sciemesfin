import 'package:flutter/material.dart';

class Resourec {
  List<Map<String, dynamic>> resource = [
    {
      "title": "Hydro Carbon",
      "subtitle": "Organic Chemistry",
      "desc":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "icon": Icons.all_inclusive,
      "img": "assets/images/img1.jpg"
    },
    {
      "title": "ICT",
      "subtitle": "Computer SCience",
      "desc":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "icon": Icons.mobile_screen_share,
      "img": "assets/images/img3.jpg"
    },
    {
      "title": "Matter and universe",
      "subtitle": "Physical Chemitry",
      "desc":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "icon": Icons.add_circle,
      "img": "assets/images/img2.jpg"
    },
    {
      "title": "Atomic Theory",
      "subtitle": "Introduction to Chemistry",
      "desc":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "icon": Icons.add_circle,
      "img": "assets/images/img4.jpg"
    },
    {
      "title": "Space Science",
      "subtitle": "AStronomy",
      "desc":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "icon": Icons.add_circle,
      "img": "assets/images/img5.jpg"
    },
    {
      "title": "Startups Business ",
      "subtitle": "Business",
      "desc":
          "Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
      "icon": Icons.add_circle,
      "img": "assets/images/img6.jpg"
    }
  ];

  List<Map<String, dynamic>> getResource() {
    return resource;
  }
}
