
import 'dart:convert';

import 'package:flutter/cupertino.dart';



class newsModel with ChangeNotifier {
  newsModel({
    required this.title,
    required this.text,
    required this.date,
  });

  String title;
  String text;
  String date;


}