import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'database_key.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final picker = ImagePicker();
  FirebaseDatabase? _database;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference? reference;
  String _databaceURL =
      'https://bogleboogle-default-rtdb.asia-southeast1.firebasedatabase.app/';

  List<Boggle> glegle = new List.empty(growable: true);
  @override
  void initState() {
    super.initState();
  }

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    setState(() {
      _image = File(image!.path);
    });
  }

  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null
                ? const Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        backgroundColor: const Color(0xfff4f3f9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25.0),
            showImage(),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  tooltip: 'pick Image',
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: const Icon(Icons.add_a_photo),
                ),
                // FloatingActionButton(
                //   tooltip: 'save Image',
                //   onPressed: () {
                //     uploadFile(context)
                // ),
              ],
            )
          ],
        ));
  }
}
