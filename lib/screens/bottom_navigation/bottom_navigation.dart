import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task/view_models/bottom_navigation/vm_bottom_navigation.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VmBottomNavigation>(context, listen: true);
    return Scaffold(
      body: provider.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Repo"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Employee"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), label: "Notification"),
        ],
        onTap: (value) => provider.onItemTapped(value),
        unselectedIconTheme:
            Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
        selectedIconTheme:
            Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
        currentIndex: provider.selectedIndex,
      ),
    );
  }
}
