
import 'dart:convert';

import 'package:flutter/cupertino.dart';



class notesModel with ChangeNotifier {
  notesModel({
   // required this.filenames,
    required this.num_files,
    required this.semester,
    required this.course_id,
    required this.subject,
    required this.title,

  });

  //List<String> filenames;
  int num_files;
  int semester;
  String course_id;
  String subject;
  String title;



}