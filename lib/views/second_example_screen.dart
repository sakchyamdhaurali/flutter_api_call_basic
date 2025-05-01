import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_call_basic/models/user_model.dart';
import 'package:http/http.dart' as http;

class SecondExampleScreen extends StatefulWidget {
  const SecondExampleScreen({Key? key}) : super(key: key);

  @override
  State<SecondExampleScreen> createState() => _SecondExampleScreenState();
}

class _SecondExampleScreenState extends State<SecondExampleScreen> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserDetails() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Second Screen"))],
      ),
    );
  }
}
