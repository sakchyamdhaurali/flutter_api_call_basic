import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_call_basic/models/model_sample.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RandomAPI> postList = [];
  Future<List<RandomAPI>> getPostAPI() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(RandomAPI.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "API CALL",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF008000),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Calling API")),
          Expanded(
            child: FutureBuilder(
              future: getPostAPI(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                         
                            Text("ID ${postList[index].id}", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),

                            Text("Title", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),),
                            Text(postList[index].title.toString()),
                          
                          
                          ],
                                                ),
                        ));
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
