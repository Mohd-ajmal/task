import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task/constants/strings.dart';
import 'package:task/hooks/emp_list_view.dart';
import 'package:task/view_models/employee_details/vm_emp_details.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<VmEmployeeDetails>(context, listen: false);
    provider.onGetDetails();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VmEmployeeDetails>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.employee),
        centerTitle: false,
      ),
      body: provider.isProgress == false
          ? provider.error.isEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          controller: provider.search,
                          onChanged: (value) =>
                              provider.onSearchTriggered(query: value),
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              labelText: Strings.search,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ))),
                    ),
                    const SizedBox(height: 15.0),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return EmpListView(
                              image: provider.values[index].profileImage,
                              title: provider.values[index].username,
                              subTitle: provider.values[index].company == null
                                  ? Strings.companyNotSpecified
                                  : provider.values[index].company!.name,
                              wValue: provider.values[index],
                            );
                          },
                          separatorBuilder: (context, int index) =>
                              const Divider(
                                color: Colors.grey,
                              ),
                          itemCount: provider.values.length),
                    ),
                  ],
                )
              : Center(child: Text(provider.error))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
