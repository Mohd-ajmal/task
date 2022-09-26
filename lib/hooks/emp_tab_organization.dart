import 'package:flutter/material.dart';
import 'package:task/constants/strings.dart';
import 'package:task/hooks/emp_text.dart';
import 'package:task/models/model_emp.dart';

class EmpOrganizationTab extends StatelessWidget {
  EmpOrganizationTab({Key? key, required this.wValue}) : super(key: key);

  EmployeeDetails wValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmpText(
            name: Strings.companyName,
            vale: wValue.company == null
                ? Strings.notSpecified
                : wValue.company!.name),
        const SizedBox(height: 20.0),
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                Strings.aboutMe,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            const SizedBox(
              width: 30,
              child: Text(Strings.hifen),
            ),
            Expanded(
                child: Text(
              wValue.company == null
                  ? Strings.notSpecified
                  : wValue.company!.catchPhrase,
              style: const TextStyle(fontSize: 15.0),
            ))
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            const SizedBox(
              width: 100,
              child: Text(
                Strings.bussiness,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            const SizedBox(
              width: 30,
              child: Text(Strings.hifen),
            ),
            Expanded(
                child: Text(
              wValue.company == null
                  ? Strings.notSpecified
                  : wValue.company!.bs,
              style: const TextStyle(fontSize: 15.0),
            ))
          ],
        ),
      ],
    );
  }
}
