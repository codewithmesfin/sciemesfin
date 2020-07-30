import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.7,
      decoration: BoxDecoration(
        //color: Color(0xfff5f8fd),
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.only(top: 7, bottom: 10),
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search eesand",
                hintStyle: Theme.of(context).textTheme.subtitle2,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
