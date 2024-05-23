import 'package:flutter/material.dart';
import 'package:calcapp/View/CalcBody.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          title: Text(
            "Calculator",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 33,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.settings,
                  size: 33,
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: CalcBody());
  }
}
