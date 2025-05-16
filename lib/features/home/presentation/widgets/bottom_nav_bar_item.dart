import 'package:flutter/material.dart';

Color greyColor = Colors.grey;

List<BottomNavigationBarItem> bottomNavBarList = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'ดูทีวีสด',
    backgroundColor: greyColor,
  ),
  BottomNavigationBarItem(
    icon: const Icon(Icons.business),
    label: 'ไฮไลท์',
    backgroundColor: greyColor,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.school),
    label: 'ย้อนหลัง',
    backgroundColor: greyColor,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.school),
    label: 'ผังรายการ',
    backgroundColor: greyColor,
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'กิจกรรม',
    backgroundColor: greyColor,
  ),
];

class BottomNavBarItem extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarItem({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        type: BottomNavigationBarType.fixed,
        items: bottomNavBarList);
  }
}
