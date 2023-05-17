import 'package:fff/helper/constants.dart';
import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/models/notifications.dart';
import 'package:flutter/material.dart';

class Notifi extends StatefulWidget {
  const Notifi({Key key}) : super(key: key);

  @override
  State<Notifi> createState() => _NotifiState();
}

class _NotifiState extends State<Notifi> {
  List not = [
    {
      "image": "images/55.jpg",
      "description": "Your appointment with doctor is today at 9 Am",
      "time": "18m ago"
    },
    {
      "image": "images/55.jpg",
      "description": "Your appointment with doctor is tomorrow at 11 Am",
      "time": "18m ago"
    },
    {
      "image": "images/55.jpg",
      "description": "Your appointment with doctor is today at 9 Am",
      "time": "18m ago"
    },
    {
      "image": "images/55.jpg",
      "description": "Your appointment with doctor is today at 9 Am",
      "time": "18m ago"
    },
    {
      "image": "images/55.jpg",
      "description": "Your appointment with doctor is today at 9 Am",
      "time": "18m ago"
    }
  ];
  @override
  void initState() {
    // TODO: implement initState
    getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: Colors.black,
            )),
      ),
      body: ListView.builder(
          itemCount: myNotifications.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Container(
                width: 80,
                height: 80,
                child: Image.asset(
                  "${not[i]['image']}",
                ),
              ),
              title: Text(
                "${myNotifications[i].notification}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${myNotifications[i].created_at}"),
            );
          }),
    );
  }

  List<MyNotification> myNotifications = [];
  getNotifications() async {
    print('notifications');
    await DioHelper.getData(
      url: AppEndPoints.notifications,
      token: globalUser.token,
    ).then((value) {
      value.data['notifications'].forEach((e){
        myNotifications.add(MyNotification.fromJson(e));
      });
      setState(() {
        myNotifications;
      });
    }).catchError((err) {
      print(err.toString());
    });
    print('notifications');
  }
}
