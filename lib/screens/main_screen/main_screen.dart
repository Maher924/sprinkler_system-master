import 'package:flutter/material.dart';
import 'package:sprinkler_system/screens/home_screen/home_screen.dart';
import 'package:sprinkler_system/screens/main_screen/local_widgets/custom_bottom_nav_bar.dart';
import 'package:sprinkler_system/screens/profile_screen/profile_screen.dart';
import 'package:sprinkler_system/screens/report_screen/report_screen.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main';

   MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  void _onChanged(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final List<Widget> _tabs = [
    ProfileScreen(),
    HomeScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _tabs.length,
              itemBuilder: (context, index) => _tabs[_selectedIndex],
            ),
          ),
          CustomBottomNavBar(
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }
}
