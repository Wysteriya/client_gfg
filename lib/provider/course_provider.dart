import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insurego_gfg/models/attendance_model.dart';
import 'package:insurego_gfg/models/city_model.dart';
import 'package:insurego_gfg/models/course_model.dart';
import 'package:insurego_gfg/models/institute_model.dart';
import 'package:insurego_gfg/models/news_model.dart';
import 'package:insurego_gfg/models/userModel.dart';
import 'package:insurego_gfg/repo/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();
  HomeRepository get homeRepo => _homeRepo;
  String cityName = "Select City";
  String instituteName = 'Select Institute';
  String courseName = "Select Course";
  String stream = "Select Stream";
  String gender = "Select Gender";
  String semester = "Select Semester";
  String student_id = "";
  String id = "";

  String profileImage = '';
  String user = 'Teacher';
  String city_id = "0";
  String institude_id = "0";
  bool instituteNameError = false;
  bool city_idError = false;
  bool nameError = false;
  bool emailError = false;
  bool cityNameError = false;
  bool _isLoading = false;
  bool passwordError = false;

  bool get isLoading => _isLoading;

  List<courseModel> _CourseItems = [];

  List<courseModel> get CourseItems {
    return [..._CourseItems];
  }



//  getInstitute() async {
//     _IntItems = [];
//     _IntItems.add(instituteModel(
//       id: "0",
//       name: "Select Institute",
//     ));
//
//     await _homeRepo.fetchAndSetInstitute(cityName).then((response) {
//       final responseData = json.decode(response);
//       responseData['institutes'].forEach((prodData) {
//         _IntItems.add(
//             instituteModel(id: prodData['institute_id'], name: prodData['name']));
//       });
//     });
//
//     notifyListeners();
//   }

  void updateUserType(String value) {
    user = value;
    notifyListeners();
  }


//   CourseName(BuildContext context) async {
//     _CourseItems = [];
//
//     await _homeRepo.fetchAndCourseId(course_name).then((response) async {
//       final responseData = json.decode(response);
//       print(responseData);
//       responseData['courses'].forEach((prodData) {
//         _CourseItems.add(courseModel(
//           Coursename: prodData['Coursename'],
//           course_id: prodData['course_id'],
//           institute_id: prodData['institute_id'],
//         ));
//       });
//     });
//
//     notifyListeners();
//   }

  void _showDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('NepApp!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size.fromHeight(40.0)),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            child: const Text('Okay'),
            onPressed: () {
              //nameController.text = "";
              notifyListeners();
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
