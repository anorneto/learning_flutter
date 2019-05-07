// import helper libraries
import 'package:flutter/material.dart';
import 'src/pages/home_page.dart';
// define main function
void main () {
  runApp(
    MaterialApp(
      title: 'Learning Flutter',
      home: HomePage(),
      theme: ThemeData(hintColor:  Colors.white),
    )
   );
}
