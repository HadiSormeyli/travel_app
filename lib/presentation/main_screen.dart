import 'package:flutter/material.dart';
import 'package:travel_app/presentation/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;


  final List _widgets =[
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          fixedColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "MyOrder",
              icon: Icon(Icons.reorder),
            ),
            BottomNavigationBarItem(
              label: "Saved",
              icon: Icon(Icons.favorite_outline_rounded),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],
          onTap: (int indexOfItem) {
            setState(() {
              _currentIndex = indexOfItem;
            });
          }),
    ));
  }
}
