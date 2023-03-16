import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PDFAPI{
  static Future<File> loadNetwork(String url) async {
      final Url= Uri.parse(url);
    final response = await http.get(Url);
    final bytes = response.bodyBytes;
    return _storeFile(url,bytes);
  }
 static Future<File> _storeFile(String url,List<int>bytes) async{
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes,flush: true);
    return file;

 }
}