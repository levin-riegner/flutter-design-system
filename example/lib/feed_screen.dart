import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lr_design_system/theme/theme.dart';
import 'package:lr_design_system/views/ds_inner_list.dart';
import 'package:showcase/example/action_detail_screen.dart';
import 'package:showcase/example/announcement.dart';
import 'package:showcase/example/announcement_card.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final announcementsList = [
      Announcement(title: "Complete your profile", points: 2, description: "Add spousal information to get extra points."),
      Announcement(
          title: "Refer friends",
          points: 5,
          description:
              "Refer your friends to join the network and earn points to get access to super awesome rewards around the world la la la."),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Rose Union"),
        actions: <Widget>[Icon(Icons.supervised_user_circle)],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return DSInnerList(
                      height: 136,
                      items: announcementsList,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? ThemeProvider.theme.spacing.l : ThemeProvider.theme.spacing.s,
                            right: index == announcementsList.length - 1 ? ThemeProvider.theme.spacing.l : 0,
                          ),
                          child: AnnouncementCard(
                            width: MediaQuery.of(context).size.width - 12 - 24 - 24,
                            announcement: announcementsList[index],
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                return ActionDetailScreen(action: announcementsList[index]);
                              }));
                            },
                          ),
                        );
                      },
                    );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), title: Text("Rewards")),
              BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),
            ],
          )
        ],
      ),
    );
  }
}
