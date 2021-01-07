import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_search/Screens/login_page.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:job_search/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userkey;

  @override
  void initState() {
    getSFkey().then((value) {
      setState(() {
        userkey = value;
      });
    });
    super.initState();
  }

  getSFkey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sfkey = await prefs.getString('jobsearchuserkey');
    print('hello');
    return sfkey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: userkey == null
          ? LoginPage()
          : Home(id: int.parse(userkey.substring(4))),
    );
  }
}
