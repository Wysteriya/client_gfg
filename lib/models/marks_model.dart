import 'dart:convert';

import 'package:flutter/cupertino.dart';

class marksModel with ChangeNotifier {
  marksModel({
    required this.ia,
    required this.see,
    required this.subject,
  });

  int ia;
  int see;
  String subject;
}
