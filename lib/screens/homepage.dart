import 'package:firebaseAuthentication/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text("Welcome to the homepage you are authenticated"),
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text("Sign out"),
              onPressed: () {
                controller.signOut();
              },
            ),
          )
        ],
      ),
    );
  }
}
