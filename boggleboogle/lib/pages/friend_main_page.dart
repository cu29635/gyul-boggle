import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_page.dart';
import 'friend_page.dart';

class FriendMainScreen extends StatefulWidget {
  @override
  _FriendMainScreenState createState() => _FriendMainScreenState();
}

class _FriendMainScreenState extends State<FriendMainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendScreen(),
          ChatScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisH),
            label: "",
          ),
        ],
      ),
    );
  }
}
