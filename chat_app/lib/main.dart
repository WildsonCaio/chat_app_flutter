import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/views/feed_page.dart';
import 'package:chat_app/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        useMaterial3: false
      ),
    ),
  );
}
