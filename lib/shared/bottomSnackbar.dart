import 'package:eesand/data/bottomToolbar.dart';
import 'package:flutter/material.dart';

class BottomSnackbar extends StatelessWidget {
  final String title;
  final String subtitle;
  BottomSnackbar({this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    BottomToolbar bt = BottomToolbar();
    List<Map<String, dynamic>> data = bt.getData();
    return Container(
      height: 400,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColorDark,
            child: ListTile(
              dense: true,
              title: Text(
                "$title",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                "$subtitle",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: Theme.of(context).colorScheme,
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: .5,
                indent: 0,
                color: Color(0xFFDDDDDD),
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return ListTile(
                  dense: true,
                  leading: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(data[index]["icon"]),
                    ),
                  ),
                  title: Text(
                    data[index]["title"],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    data[index]["subtitle"],
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
