import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:boggleboogle/main.dart';

class PhotoAddPage extends StatefulWidget {
  //PhotoAddPage({Key? key}) : super(key: key);
  final DatabaseReference reference;

  PhotoAddPage(this.reference);

  @override
  State<StatefulWidget> createState() => _PhotoAddPageState();
}

class _PhotoAddPageState extends State<PhotoAddPage> {
  TextEditingController? titleController;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
