import 'package:flutter/material.dart';
import '../View/addPicture.dart';
import '../View/allPictures.dart';
import '../View/index.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
      initialRoute: '/index',
      routes: {
        '/index' : (context)=> index(),
        '/allPictures':(context) => allPictures(),
        '/add' : (context) => addPicture(),
      }
  ));
}
