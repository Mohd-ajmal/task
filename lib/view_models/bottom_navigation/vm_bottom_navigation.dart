import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/employee/employee.dart';

import 'package:task/screens/repo/repo.dart';
import 'package:task/view_models/employee_details/vm_emp_details.dart';
import 'package:task/view_models/github_repo/vm_github.dart';

class VmBottomNavigation extends ChangeNotifier {
  // ----------------------------------- Getters -------------------------------
  int get selectedIndex => _selectedIndex;

  // ---------------------------------- Variables ------------------------------

  int _selectedIndex = 0;

  //

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  getBody() {
    switch (_selectedIndex) {
      case 0:
        return ChangeNotifierProvider(
            create: (BuildContext context) => VmGithub(), child: const Repo());
      case 1:
        return ChangeNotifierProvider(
            create: (BuildContext context) => VmEmployeeDetails(),
            child: const EmployeeDetailsScreen());
      default:
        return const Center(child: Text("Notification"));
    }
  }
}
