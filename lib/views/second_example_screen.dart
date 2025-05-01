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
      appBar: AppBar(title: Text("Fetching USERS API"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("USER DETAILS", style: TextStyle(fontSize: 22),)),

          Expanded(
            child: FutureBuilder(
              future: getUserDetails(),
              builder: (builder, AsyncSnapshot<List<UserModel>> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                             _showUserDetails(title: "Name:", value: snapshot.data![index].name.toString()),
                             _showUserDetails(title: "Username:", value: snapshot.data![index].username.toString()),
                             _showUserDetails(title: "Email:", value: snapshot.data![index].username.toString()),
                             _showUserDetails(title: "Address:", value: snapshot.data![index].address!.city.toString()),



                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _showUserDetails(
  {
    required String title,
    required String value,


  }
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title), 
        Text(value),
          ],
    ),
  );
}
