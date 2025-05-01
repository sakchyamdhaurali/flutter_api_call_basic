import 'package:flutter/material.dart';

class SecondExampleScreen extends StatelessWidget {
const SecondExampleScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Second Screen"),
          )
        ],
      ),
    );
  }
}