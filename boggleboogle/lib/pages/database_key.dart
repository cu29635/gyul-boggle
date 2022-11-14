//import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Boggle {
  String? key;
  final int boggle;
  final String date;

  Boggle(this.boggle, this.date);

  Boggle.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key.toString(),
        boggle = (snapshot.value! as Map<int, dynamic>)['boggle'],
        date = (snapshot.value! as Map<String, dynamic>)['date'];

  toJson() {
    return {
      'boggle': boggle,
      'date': date,
    };
  }
}
