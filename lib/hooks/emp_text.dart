import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmpText extends StatelessWidget {
  EmpText({Key? key, required this.name, required this.vale}) : super(key: key);
  String name;
  String vale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 30,
          child: Text("-"),
        ),
        Text(
          vale,
          style: const TextStyle(fontSize: 15.0),
        )
      ],
    );
  }
}
