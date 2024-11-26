import 'package:flutter/material.dart';
import 'package:todo_app/screens/new_task_screen.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabState();
  }
}

class _TabState extends State<Tabs> {
  int _selectedPageIndex = 0;
  final _pageController = PageController();

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const Todo();
    if (_selectedPageIndex == 2) {
      activeScreen = NewTaskScreen(selectPage: _selectPage);
    } else if (_selectedPageIndex == 1) {
      activeScreen = const Todo();
    } else if (_selectedPageIndex == 4) {
      activeScreen = const ProfileScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('later..'),
      ),
      body: activeScreen,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        // selectedLabelStyle: const TextStyle(color: Colors.cyan),
        // unselectedLabelStyle: const TextStyle(color: Colors.red),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_rounded), label: 'add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grading_sharp), label: 'Overview'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Me'),
        ],
      ),
    );
  }
}
