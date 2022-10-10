const String tableMail = 'mail';

class MailFields {
  static final List<String> values = [id, desc, status, dateTime];

  static const String id = 'transId';
  static const String desc = 'transDescription';
  static const String status = 'transStatus';
  static const String dateTime = 'transDateTime';
}

class MailTable {
  int id;
  String desc;
  String status;
  String dateTime;

  MailTable(
      {required this.id,
      required this.desc,
      required this.status,
      required this.dateTime});

  MailTable copy({int? id, String? desc, String? status, String? dateTime}) =>
      MailTable(
          id: id ?? this.id,
          desc: desc ?? this.desc,
          status: status ?? this.status,
          dateTime: dateTime ?? this.dateTime);

  static MailTable fromJson(Map<String, Object?> json) => MailTable(
      id: json[MailFields.id] as int,
      desc: json[MailFields.desc] as String,
      status: json[MailFields.status] as String,
      dateTime: json[MailFields.dateTime] as String);

  Map<String, Object?> toJson() => {
        MailFields.id: id,
        MailFields.desc: desc,
        MailFields.status: status,
        MailFields.dateTime: dateTime
      };
}
