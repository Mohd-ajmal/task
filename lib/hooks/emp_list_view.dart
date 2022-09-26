import 'package:flutter/material.dart';

import 'package:task/constants/images.dart';
import 'package:task/constants/strings.dart';
import 'package:task/hooks/emp_tab_organization.dart';
import 'package:task/hooks/emp_tab_personel.dart';
import 'package:task/models/model_emp.dart';

class EmpListView extends StatelessWidget {
  EmpListView(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.wValue})
      : super(key: key);
  String? image;
  String title;
  String? subTitle;
  EmployeeDetails wValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
          context: context,
          builder: (context) {
            return DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_downward),
                    Card(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                image ?? Images.emptyPerson,
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  subTitle ?? Strings.companyNotSpecified,
                                  style: const TextStyle(fontSize: 15.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.person),
                          text: Strings.personel,
                        ),
                        Tab(
                          icon: Icon(Icons.location_city),
                          text: Strings.organization,
                        )
                      ],
                      indicatorColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.red,
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EmpPersonelTab(
                            wValue: wValue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: EmpOrganizationTab(
                            wValue: wValue,
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            );
          }),
      leading: CircleAvatar(
        backgroundImage: const AssetImage(Images.emptyPersonJpeg),
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Image.network(
            image ?? Images.emptyPerson,
          ),
        ),
        radius: 30,
      ),
      title: Text(title),
      subtitle:
          Text(subTitle == null ? Strings.companyNotSpecified : subTitle!),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
