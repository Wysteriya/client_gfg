import 'dart:convert';

import 'package:flutter/cupertino.dart';

class attendanceModel with ChangeNotifier {
  attendanceModel({
    required this.date,
    required this.percentage,
    required this.subject,
  });

  String date;
  int percentage;
  String subject;
}
