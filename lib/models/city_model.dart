
import 'dart:convert';

import 'package:flutter/cupertino.dart';



class cityModel with ChangeNotifier {
  cityModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

}

