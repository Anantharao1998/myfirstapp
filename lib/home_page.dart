import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Center(
            child: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Hello Deriv',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
