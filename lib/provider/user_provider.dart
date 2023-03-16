import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insurego_gfg/models/attendance_model.dart';
import 'package:insurego_gfg/models/city_model.dart';
import 'package:insurego_gfg/models/course_model.dart';
import 'package:insurego_gfg/models/institute_model.dart';
import 'package:insurego_gfg/models/marks_model.dart';
import 'package:insurego_gfg/models/news_model.dart';
import 'package:insurego_gfg/models/notes_model.dart';
import 'package:insurego_gfg/models/subject_model.dart';
import 'package:insurego_gfg/models/userModel.dart';
import 'package:insurego_gfg/repo/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  HomeRepository get homeRepo => _homeRepo;
  String cityName = "Select City";
  String Subject = "";
  String instituteName = 'Select Institute';
  String courseName = "Select Course";
  String stream = "Select Stream";
  String gender = "Select Gender";
  int semester = 1;
  String course_cid = "";
  String student_id = "";
  String id = "";
  String cid = '';
  String branch = "";

  UserProvider(this.student_id, this.institude_id, this.branch, this._courseId);
  String _courseId;

  String get courseId => _courseId;

  Future<void> retrieveDataFromSharedPreferences() async {
    // Retrieve the value of 'course_id' from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    _courseId = prefs.getString('course_id')!;

    // Notify listeners that the value(s) have changed
    notifyListeners();
  }


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

  List<userModel> _UserItems = [];

  List<userModel> get UserItems {
    return [..._UserItems];
  }

  List<attendanceModel> _AtdanceItems = [];

  List<attendanceModel> get AtdanceItems {
    return [..._AtdanceItems];
  }

  List<newsModel> _NewsItems = [];

  List<newsModel> get NewsItems {
    return [..._NewsItems];
  }

  List<marksModel> _MarksItems = [];

  List<marksModel> get MarksItems {
    return [..._MarksItems];
  }

  List<courseModel> _CourseItems = [];

  List<courseModel> get CourseItems {
    return [..._CourseItems];
  }

  List<subjectModel> _SubjectItems = [];

  List<subjectModel> get SubjectItems {
    return [..._SubjectItems];
  }

  List<notesModel> _NotesItems = [];

  List<notesModel> get NotesItems {
    return [..._NotesItems];
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
  void updateSubject(String value) {
    Subject = value;
    AllMarks();
    notifyListeners();
  }
  void updateSemester(int value) {
    semester = value;
    GetNotes();
    notifyListeners();
  }

  AllMarks() async {
    _MarksItems = [];

    await _homeRepo
        .fetchAndSetMarks(Subject,student_id)
        .then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      responseData['marks'].forEach((prodData) {
        _MarksItems.add(marksModel(
          ia: prodData['ia'],
          see: prodData['see'],
          subject: prodData['subject'],
        ));
      });
    });

    notifyListeners();
  }

  AllSubject(BuildContext context) async {
    _SubjectItems = [];
    await SharedPreferences.getInstance().then((prefs) {
      // prefs.setString('_id', _id);
      prefs.setString('Subjectname', Subject);
      final course_cidd = prefs.getString('course_id');
    });

    await _homeRepo
        .fetchAndGetAllSubjects(_courseId,institude_id)
        .then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      responseData['courses'].forEach((prodData) {
        _SubjectItems.add(subjectModel(
          Subjectname: prodData['Subjectname'],
          course_id: prodData['course_id'],
          institute_id: prodData['institute_id'],
          semester: prodData['semester'],
        ));
        Subject = prodData['Subjectname'];
      });
    });


    notifyListeners();
  }

  GetNotes() async {
    _NotesItems = [];

    await _homeRepo
        .GetNotes(semester,_courseId)
        .then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      responseData['all_events'].forEach((prodData) {
        _NotesItems.add(notesModel(
          title: prodData['title'],
          subject: prodData['subject'],
          semester: prodData['semester'],
          num_files: prodData['num_files'],
         // filenames: prodData['filenames'],
          course_id: prodData['course_id'],
        ));
      });
    });


    notifyListeners();
  }

  AllCourseName(BuildContext context) async {
    _CourseItems = [];

    await _homeRepo.fetchAndCourseId(branch).then((response) async {
      print(branch);
      final responseData = json.decode(response);
      print(responseData);
      responseData['courses'].forEach((prodData) {
        _CourseItems.add(courseModel(
          Coursename: prodData['Coursename'],
          course_id: prodData['course_id'],
          institute_id: prodData['institute_id'],
        ));
        print(prodData['course_id']);
        _courseId = prodData['course_id'];
      });
      await SharedPreferences.getInstance().then((prefs) {
        // prefs.setString('_id', _id);
        prefs.setString('course_id', _courseId);
      });
    });

    notifyListeners();
  }

  UserData(BuildContext context) async {
    _UserItems = [];
    await _homeRepo.getUserwithStudent_Id(student_id).then((response) async {
      final responseData = json.decode(response);
      print(responseData);

      responseData['user'].forEach(

            (prodData) {
          _UserItems.add(userModel(
              name: prodData['name'],
              institute_id: prodData['institute_id'],
              city_id: prodData['city_id'],
              branch: prodData['branch'],
              stream: prodData['stream'],
              emailAddress: prodData['emailAddress'],
              gender: prodData['gender'],
              semester: prodData['semester'],
              password: prodData['password'],
              date: prodData['date']));
          id = prodData['institute_id'];
          branch = prodData['branch'];
          print(branch);
        },
      );
    });
    await SharedPreferences.getInstance().then((prefs) {
      // prefs.setString('_id', _id);
      prefs.setString('institute_id', id);
      prefs.setString('branch', branch);
    });

    notifyListeners();
  }

  Attendance(BuildContext context) async {
    _AtdanceItems = [];

    await _homeRepo.fetchAndSetAttendance(student_id).then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      responseData['cities'].forEach((prodData) {
        _AtdanceItems.add(attendanceModel(
          date: prodData['date'],
          percentage: prodData['percentage'],
          subject: prodData['subject'],
        ));
      });
    });

    notifyListeners();
  }

  Announcement(BuildContext context) async {
    _NewsItems = [];

    await _homeRepo.fetchAndSetNews(id).then((response) async {
      final responseData = json.decode(response);
      print(responseData);
      responseData['announcement'].forEach((prodData) {
        _NewsItems.add(newsModel(
          title: prodData['title'],
          text: prodData['text'],
          date: prodData['date'],
        ));
      });
    });

    notifyListeners();
  }


}

  void _showDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) =>
          AlertDialog(
            title: const Text('NepApp!'),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                      const Size.fromHeight(40.0)),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                child: const Text('Okay'),
                onPressed: () {
                  //nameController.text = "";
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
    );
  }
