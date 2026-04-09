import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/HomePage.dart';
import 'package:ecommerce/signup.dart';
import 'package:ecommerce/forgot.dart';
import 'package:ecommerce/LoginPage.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen ({super.key});
  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}
class _WrapperScreenState extends State<WrapperScreen> {

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}