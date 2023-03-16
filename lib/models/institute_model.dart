
import 'dart:convert';

import 'package:flutter/cupertino.dart';



class instituteModel with ChangeNotifier {
  instituteModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

}