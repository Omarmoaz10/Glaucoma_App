import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glaucoma_app/Model/User_Model.dart';
import 'package:glaucoma_app/UI/HeroSection/heroSection.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://glac-detect.herokuapp.com/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      print("login");

      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      print("eror");
      throw Exception('Failed to login');
    }
  }

  Future<User> signup(
      String f_name, String l_name, String email, String password) async {
    final response = await http.post(
      Uri.parse('https://glac-detect.herokuapp.com/user/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'fname': f_name,
        'lname': l_name,
        'email': email,
        'password': password
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      print("Signup succsses");
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 CREATED response,
      // then throw an exception.
      print("eror");
      throw Exception('Failed to SignUp');
    }
  }
}
