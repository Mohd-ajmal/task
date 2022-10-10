import 'package:flutter/material.dart';
import 'package:task/constants/strings.dart';
import 'package:task/hooks/emp_text.dart';
import 'package:task/models/model_emp.dart';

// ignore: must_be_immutable
class EmpPersonelTab extends StatelessWidget {
  EmpPersonelTab({Key? key, required this.wValue}) : super(key: key);
  EmployeeDetails wValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EmpText(name: "Name", vale: wValue.name),
        const SizedBox(height: 10.0),
        EmpText(name: "Username", vale: wValue.username),
        const SizedBox(height: 10.0),
        EmpText(name: "E-Mail", vale: wValue.email),
        const SizedBox(height: 10.0),
        EmpText(name: "Phone", vale: wValue.phone ?? Strings.notSpecified),
        const SizedBox(height: 10.0),
        EmpText(name: "Website", vale: wValue.website ?? Strings.notSpecified),
        const SizedBox(height: 15.0),
        const Center(
          child: Text(
            "Address",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        const SizedBox(height: 10.0),
        EmpText(name: "Street", vale: wValue.address.street),
        const SizedBox(height: 10.0),
        EmpText(name: "Suite", vale: wValue.address.suite),
        const SizedBox(height: 10.0),
        EmpText(name: "City", vale: wValue.address.city),
        const SizedBox(height: 10.0),
        EmpText(name: "Zipcode", vale: wValue.address.zipcode),
        const SizedBox(height: 15.0),
        const Center(
          child: Text(
            "Geo",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        const SizedBox(height: 10.0),
        EmpText(name: "Lat", vale: wValue.address.geo.lat),
        const SizedBox(height: 10.0),
        EmpText(name: "Lng", vale: wValue.address.geo.lng),
      ],
    );
  }
}
