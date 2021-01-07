import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:job_search/Screens/home.dart';
import 'package:job_search/Screens/homepage.dart';
import 'package:job_search/Screens/registration_page.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:job_search/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  bool showerrorbox = false;
  int id;
  String errormsg = 'hello';

  Map<String, dynamic> result;
  Future<Map<String, dynamic>> getApi(String email, String password) async {
    final response = await http
        .post(apiUrls.url, body: {"email": email, "password": password});
    final data = jsonDecode(response.body);

    return data;
  }

  Widget errorbox(String msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 2)),
        child: Text(
          msg,
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
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
              Text('Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                height: 20,
              ),
              if (showerrorbox) errorbox(errormsg),
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
                title: 'Sign In',
                isbackgroundcolor: true,
                onPressed: () async {
                  result = await getApi(email, password);

                  if (result['status'] == 1) {
                    print('user${result['id']}');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(
                        'jobsearchuserkey', "user${result['id']}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Home(id: int.parse(result['id'] ?? 0))));
                  } else {
                    setState(() {
                      showerrorbox = true;
                      errormsg = result['msg'];
                    });
                  }
                },
              ),
              CustomButton(
                  title: 'Create new account',
                  isbackgroundcolor: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
