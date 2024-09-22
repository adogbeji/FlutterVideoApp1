import 'package:flutter/material.dart';

import 'package:video_app_1/views/screens/home/for_you/for_you_video_screen.dart';
import 'package:video_app_1/views/screens/home/search/search_screen.dart';
import 'package:video_app_1/views/screens/home/upload_video/upload_video_screen.dart';
import 'package:video_app_1/views/screens/home/following/followings_video_screen.dart';
import 'package:video_app_1/views/screens/home/profile/profile_screen.dart';

import 'package:video_app_1/views/screens/home/upload_video/upload_custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  List<Widget> screenList = [
    const ForYouVideoScreen(),
    const SearchScreen(),
    const UploadVideoScreen(),
    const FollowingsVideoScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            screenIndex = value;
          });
        },
        currentIndex: screenIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.amber,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 20,),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.add, size: 20,),
            icon: UploadCustomIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_sharp, size: 20,),
            label: 'Following',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 20,),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}