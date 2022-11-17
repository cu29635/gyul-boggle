import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/main.dart';
import 'calendar_page.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _TmpPageState createState() => _TmpPageState();
}

class _TmpPageState extends State<MyHomePage> {
  String? data;

  _getdata() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      data = user?.email;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    _getdata();
    super.initState();
    _permission();
    _logout();
    _auth();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //

  _permission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    //logger.i(statuses[Permission.storage]);
  }

  _auth() {
    // 사용자 인증정보 확인. 딜레이를 주어서 확인
    Future.delayed(const Duration(milliseconds: 100), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Get.off(() => const LoginPage());
      } else {
        Get.off(() => CalendarPage(
              mail: data,
            ));
      }
    });
  }

  _logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
