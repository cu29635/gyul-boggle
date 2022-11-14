import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:boggleboogle/components/calendar_compo.dart';
import 'my_home_page.dart';
import 'chat_page.dart';
import 'friend_main_page.dart';

class CalendarPage extends StatefulWidget {
  final mail;
  const CalendarPage({
    Key? key,
    @required this.mail,
  }) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  String? user_id;

  _getdata() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      user_id = user?.email;
      if (user != null) {
        print(user.uid);
      }
      print(user?.email);
    });
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("로그아웃에 성공했습니다."),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("로그아웃에 실패했습니다."),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidmainAppbar(),
      drawer: _bulidmainDrawer(),
      body: Column(
        children: [
          CalendarCom(mail: widget.mail),
          //),<- 이거 문제임
        ],
      ),
    );
  }

  //Appbar
  AppBar _bulidmainAppbar() => AppBar(
        title: Text("보글부글"),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            //padding: EdgeInsets.only(right: 320.0),
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            //padding: EdgeInsets.only(right: 50.0),
            icon: Icon(Icons.people),
            onPressed: () {
              Get.to(() => FriendMainScreen());
            },
          )
        ],
      );
  //Drawer
  Drawer _bulidmainDrawer() => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('프로필'),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
            ),
            ListTile(
              title: Text('설정'),
              onTap: () {
                Get.to(() => SettingPage());
              },
            ),
            ListTile(
              title: Text('로그아웃'),
              onTap: () {
                signOut();
                Get.offAll(() => MyHomePage());
              },
            ),
          ],
        ),
      );
}
