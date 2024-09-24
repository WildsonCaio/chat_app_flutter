import 'package:chat_app/views/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        useMaterial3: false
      ),
    ),
  );
}
