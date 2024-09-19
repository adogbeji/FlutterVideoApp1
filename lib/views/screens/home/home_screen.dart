import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.amber,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 16,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 16,),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 16,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_sharp),
            label: 'Following',
          ),
        ],
      ),
    );
  }
}