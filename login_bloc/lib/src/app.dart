import 'package:flutter/material.dart';
import './screens/login_screen.dart';
import "./blocs/provider.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
          title: "Log Me In",
          home: Scaffold(
            body: LoginScreen(),
          )),
    );
  }
}
