import 'dart:convert';

import 'package:flutter/cupertino.dart';

class subjectModel with ChangeNotifier {
  subjectModel({
    required this.Subjectname,
    required this.institute_id,
    required this.course_id,
    required this.semester,
  });

  String Subjectname;
  String institute_id;
  String course_id;
  int semester;
}
