import 'package:flutter/material.dart';
import 'package:flutterappt/starting_page.dart';

/// This function is like the starting point of the application

void main(){
  /// The runApp function should be called from the main function, just like C++.
  runApp(
    /// The [MaterialApp] is a the main backbone of the application.
    /// we can use its property [home] in order to pass the main screen to be launched.
    MaterialApp(
      home: StartingPage(),
    ),
  );
}