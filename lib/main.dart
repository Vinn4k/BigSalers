import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jr_up/widget/app_widget.dart';



void main() async {
  Firebase.initializeApp();
  runApp(const AppWidget());



}
