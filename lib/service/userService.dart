import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:phpapi/model/userModel.dart';

class UserService {
  static const ADD_URL = "http://192.168.40.35/flutterphpmysqlcrud/add.php";
  static const VIEW_URL = "http://192.168.40.35/flutterphpmysqlcrud/read.php";
  static const UPDATE_URL = "http://192.168.40.35/flutterphpmysqlcrud/edit.php";
  static const DELETE_URL =
      "http://192.168.40.35/flutterphpmysqlcrud/delete.php";

  Future<String> addUser(UserModel userModel) async {
    final response =
        await http.post(Uri.parse(ADD_URL), body: userModel.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  List<UserModel> userFromJson(String jsonString) {
    final data = json.decode(jsonString);
    return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
  }

  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(VIEW_URL));
    if (response.statusCode == 200) {
      List<UserModel> list = userFromJson(response.body);
      return list;
    } else {
      // throw Exception('Failed to load');
      return Future.error('Failed to load');
      // return List<UserModel>();
    }
  }

  Future<String> updateUser(UserModel userModel) async {
    final response =
        await http.post(Uri.parse(UPDATE_URL), body: userModel.toJsonUpdate());
    if (response.statusCode == 200) {
      print("Update Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }

  Future<String> deleteUser(UserModel userModel) async {
    final response = await http.post(
        Uri.parse(
          DELETE_URL,
        ),
        // it returns the id of the user from the toJsonDelete method
        body: userModel.toJsonDelete());
    // response.body = jsonEncode("id":id);
    if (response.statusCode == 200) {
      print("Delete Response: " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
