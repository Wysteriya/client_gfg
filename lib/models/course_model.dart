import 'dart:convert';

import 'package:flutter/cupertino.dart';

class courseModel with ChangeNotifier {
  courseModel({
    required this.institute_id,
    required this.Coursename,
    required this.course_id,
  });

  String institute_id;
  String Coursename;
  String course_id;
}

