import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:job_search/Screens/home.dart';
import 'package:job_search/Screens/login_page.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:job_search/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email;
  String password;

  getapi(String email, String password) async {
    final response = await http
        .post(apiUrls.regis, body: {'email': email, 'password': password});
    final data = jsonDecode(response.body);
    if (data['status'] == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      print(data['msg']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Register',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      hintStyle: Constants.textfieldinputstyle,
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      hintStyle: Constants.textfieldinputstyle,
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              CustomButton(
                  title: 'Create Account',
                  isbackgroundcolor: true,
                  onPressed: () {
                    getapi(email, password);
                  }),
              CustomButton(
                title: 'Back to Login Screen',
                isbackgroundcolor: false,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    ));
    ;
  }
}
