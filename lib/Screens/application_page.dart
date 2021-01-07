import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_search/Screens/editapplication.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_appbar.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ApplicationPage extends StatefulWidget {
  final int id;
  ApplicationPage({this.id});
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  Map<String, dynamic> result;
  @override
  void initState() {
    getapplicationstate().then((data) {
      setState(() {
        result = data['result'];
      });
      if (result == null) {
        print('hello');
      } else {
        print(result);
      }
    });
    super.initState();
  }

  String fullname;
  String city;
  String mobile_no;
  String email;
  String description;

  getapplicationstate() async {
    final response = await http
        .post(apiUrls.checkapplicationurl, body: {'id': widget.id.toString()});
    final data = jsonDecode(response.body);
    return data;
  }

  postapplication() async {
    final response = await http.post(apiUrls.applicationurl, body: {
      'user_id': widget.id.toString(),
      'fullname': fullname,
      'city': city,
      'mobile_no': mobile_no,
      'email': email,
      'about': description
    });
    final data = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            isbackbutton: true, title: 'Your Application', context: context),
        body: result == null
            ? ListView(
                padding: EdgeInsets.only(top: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      style: Constants.textfieldinputstyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Full Name',
                          hintStyle: Constants.textfieldinputstyle,
                          contentPadding: EdgeInsets.all(18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        fullname = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      style: Constants.textfieldinputstyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          hintText: 'City',
                          hintStyle: Constants.textfieldinputstyle,
                          contentPadding: EdgeInsets.all(18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        city = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      style: Constants.textfieldinputstyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: 'Mobile NO.',
                          hintStyle: Constants.textfieldinputstyle,
                          contentPadding: EdgeInsets.all(18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        mobile_no = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      style: Constants.textfieldinputstyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'email',
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      maxLines: 100,
                      minLines: 1,
                      style: Constants.textfieldinputstyle,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.description),
                          alignLabelWithHint: true,
                          hintText: 'Description(Experience,Education,etc)',
                          hintStyle: Constants.textfieldinputstyle,
                          contentPadding: EdgeInsets.all(18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                      title: 'Submit',
                      isbackgroundcolor: true,
                      onPressed: () {
                        postapplication().then((value) {
                          getapplicationstate().then((data) {
                            setState(() {
                              result = data['result'];
                            });
                          });
                        });
                      },
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'Fullname: ${result['fullname']}',
                      style: Constants.textfieldinputstyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'City: ${result['city']}',
                      style: Constants.textfieldinputstyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'Mobile No.: ${result['mobile_no']}',
                      style: Constants.textfieldinputstyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'Email: ${result['email_id']}',
                      style: Constants.textfieldinputstyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'Description: ${result['about']}',
                      style: Constants.textfieldinputstyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomButton(
                      title: 'Edit Application',
                      isbackgroundcolor: true,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditApplication(
                                      id: widget.id.toString(),
                                      fullname: result['fullname'],
                                      city: result['city'],
                                      mobile_no: result['mobile_no'],
                                      email: result['email_id'],
                                      description: result['about'],
                                    )));
                      },
                    ),
                  )
                ],
              ));
  }
}
