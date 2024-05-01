import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:turfbokkingapp/Views/Home/client_tabs/all_turfs.dart';
import 'package:turfbokkingapp/Views/Home/client_tabs/home_tab.dart';
import 'package:turfbokkingapp/Views/Home/client_tabs/settings_tab.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const HomeTab(), const TurfListPage(), const SettingsClient()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.book),
            label: 'All Turfs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: 'Setings',
          ),
        ],
      ),
    );
  }
}
