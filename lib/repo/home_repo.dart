import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insurego_gfg/utils/url.dart';
import 'package:intl/intl.dart';

String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
//http://localhost:3000/api/client/getnotes/3/2049457a-4101-477f-aec3-19b41970d50c
class HomeRepository {
  Future<String> GetNotes(int semester,String course_id) async {
    final url = Uri.parse('${URL.url}client/getnotes/3/$course_id');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndGetAllSubjects(String course_id,String institute_id) async {
    final url = Uri.parse('${URL.url}client/getallsubjects/$course_id/$institute_id');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndCourseId(String course_name) async {
    final url = Uri.parse('${URL.url}client/getcoursebycoursename/${course_name}');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndSetMarks(String subject,String student_id) async {
    final url = Uri.parse('${URL.url}client/getmarks/$subject/$student_id');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }


  Future<String> AllInsuranceTypes() async {
    final url = Uri.parse('${URL.url}getalltypes');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }





  Future<String> fetchAndSetCity() async {
    final url = Uri.parse('${URL.url}');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndSetInstitute(String city) async {
    final url = Uri.parse('${URL.url}client/getinstitutes/$city');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndSetAttendance(String student_id) async {
    final url = Uri.parse('${URL.url}client/getattendance/$student_id');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndSetCourse() async {
    final url = Uri.parse('${URL.url}client/getallcourses');
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> fetchAndSetNews(String institute_id) async {
    final url = Uri.parse('${URL.url}client/getallannouncements/$institute_id');
    print(url);
    try {
      final response = await http.get(url);

      print(response.body);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> register(
    String name,
    String emailAddress,
    String password,
    String gender,
    String semester,
    String city_id,
    String institute_id,
    String stream,
    String branch,
  ) async {
    final url = Uri.parse(URL.url + 'client/registeruser');
    print(url);
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "name": name,
            "emailAddress": emailAddress,
            "password": password,
            "gender": gender,
            "semester": semester,
            "city_id": city_id,
            "institute_id": institute_id,
            "stream": stream,
            "branch": branch,
            "date": currentDate,
          }));

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  Future<String> login(
    String emailAddress,
    String password,
  ) async {
    final url = Uri.parse(URL.url + 'client/login');
    print(url);
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "emailAddress": emailAddress,
            "password": password,
          }));

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }

  getUserwithStudent_Id(String student_id) async {
    final url = Uri.parse(URL.url + 'client/getuser');

    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "student_id": student_id,
          }));

      print(url);

      return response.body;
    } catch (error) {
      throw (error);
    }
  }
}
