import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/mail/vm_mail.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<MailViewModal>(context, listen: false);
    provider.onGetMailStatusDetails();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MailViewModal>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Automatic Email"),
      ),
      body: Center(
        child: provider.value.isNotEmpty
            ? Table(
                defaultColumnWidth: const FixedColumnWidth(100.0),
                border: TableBorder.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 2),
                children: [
                    TableRow(children: [
                      Column(children: const [
                        Text(
                          'TransId',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                      Column(children: const [
                        Text('TransDesc', style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('TransStatus', style: TextStyle(fontSize: 15.0))
                      ]),
                      Column(children: const [
                        Text('DateTime', style: TextStyle(fontSize: 15.0))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[0].id.toString(),
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[0].desc,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[0].status,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[0].dateTime,
                            style: const TextStyle(fontSize: 12))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[1].id.toString(),
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[1].desc,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[1].status,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[1].dateTime,
                            style: const TextStyle(fontSize: 12))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[2].id.toString(),
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[2].desc,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[2].status,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[2].dateTime,
                            style: const TextStyle(fontSize: 12))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[3].id.toString(),
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[3].desc,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[3].status,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[3].dateTime,
                            style: const TextStyle(fontSize: 12))
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[4].id.toString(),
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[4].desc,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[4].status,
                            style: const TextStyle(fontSize: 12))
                      ]),
                      Column(children: [
                        Text(
                            provider.value.isEmpty
                                ? "Loading"
                                : provider.value[4].dateTime,
                            style: const TextStyle(fontSize: 12))
                      ]),
                    ]),
                  ])
            : const Text("Table Error"),
      ),
    );
  }
}
