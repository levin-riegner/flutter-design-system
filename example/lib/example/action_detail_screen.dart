import 'package:flutter/material.dart';
import 'package:showcase/example/announcement.dart';

class ActionDetailScreen extends StatelessWidget {
  final Announcement action;

  ActionDetailScreen({this.action});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: InkWell(
              child: Icon(Icons.keyboard_arrow_down),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            flexibleSpace: Image.network("https://i.pinimg.com/originals/5b/ce/5a/5bce5a30832ab856dd2bccfa04e6925d.jpg"),
            expandedHeight: 240,
            pinned: true,
            title: Text("Action Title"),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Text("I'm the title");
          })),
        ],
      ),
    );
  }
}
