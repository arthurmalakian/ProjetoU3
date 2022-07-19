import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? token;

  const User({this.id, this.name, this.email, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      token: json['token'],
    );
  }

  static Future login(String email, String password) async {
    const url = "http://localhost/api/login";
    final response = await http.post(Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: {email: email, password: password});
    String responseBody = response.body.toString();
    Map<String, dynamic> apiResponse = jsonDecode(responseBody);
    return apiResponse;
  }

  static Future logout(String token) async {
    var url = "http://localhost/api/logout";
    var response = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    String responseBody = response.body.toString();
    Map<String, dynamic> apiResponse = jsonDecode(responseBody);
    return apiResponse;
  }

  static Future register(
      String name,
      String email,
      String password,
      String password_confirmation,
      String parlor_name,
      String parlor_description,
      File image,
      double lat,
      double lon) async {
    var url = "http://localhost/api/register";
    var response = await http.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }, body: {
      name: name,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      parlor_name: parlor_name,
      parlor_description: parlor_description,
      image: image,
      lat: lat,
      lon: lon
    });
    String responseBody = response.body.toString();
    Map<String, dynamic> apiResponse = jsonDecode(responseBody);
    return apiResponse;
  }
}
