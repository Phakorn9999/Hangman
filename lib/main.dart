import 'package:flutter/material.dart';
import 'package:hangman/pages/home.dart';
import 'package:hangman/pages/setting.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    routes: {
      '/': (context) => Home(),
      '/setting': (context) => Setting(
            onReset: () {},
          ),
    },
  ));
}
