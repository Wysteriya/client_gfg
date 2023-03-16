import 'package:flutter/material.dart';
import 'package:insurego_gfg/models/insurancetype_model.dart';
import 'dart:convert';

import '../repo/home_repo.dart';

class ITypeProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  HomeRepository get homeRepo => _homeRepo;
  List<TypeModel> _TypeItems = [];

  List<TypeModel> get TypeItems {
    return [..._TypeItems];
  }

  getInsuranceTypes() async {
    _TypeItems = [];
    await _homeRepo.AllInsuranceTypes().then((response) {
      final responseData = json.decode(response);
      responseData['type'].forEach((prodData) {
        _TypeItems.add(TypeModel(
            tid: prodData['_id'],
            title: prodData['title'],
            description: prodData['description'],
            profile_pic_filename: prodData['profile_pic_filename']));
      });
    });

    notifyListeners();
  }
}
