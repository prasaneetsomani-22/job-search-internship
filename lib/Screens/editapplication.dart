import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_search/Screens/application_page.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_appbar.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class EditApplication extends StatefulWidget {
  final String id;
  final String fullname;
  final String city;
  final String mobile_no;
  final String email;
  final String description;
  EditApplication(
      {this.id,
      this.fullname,
      this.city,
      this.mobile_no,
      this.email,
      this.description});
  @override
  _EditApplicationState createState() => _EditApplicationState();
}

class _EditApplicationState extends State<EditApplication> {
  String old_fullname;
  String old_city;
  String old_mobile_no;
  String old_email;
  String old_description;

  String fullname;
  String city;
  String mobile_no;
  String email;
  String description;

  @override
  void initState() {
    fullname = widget.fullname;
    city = widget.city;
    mobile_no = widget.mobile_no;
    email = widget.email;
    description = widget.description;
    super.initState();
  }

  editapplication() async {
    final response = await http.post(apiUrls.editapplicationurl, body: {
      'id': widget.id,
      'fullname': fullname,
      'city': city,
      'mobile_no': mobile_no,
      'email': email,
      'description': description
    });
    final data = jsonDecode(response.body);
    print(data['status']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: 'Edit Application', isbackbutton: true, context: context),
        body: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                initialValue: fullname,
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                initialValue: city,
                onChanged: (value) {
                  city = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                initialValue: mobile_no,
                onChanged: (value) {
                  mobile_no = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                initialValue: email,
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                initialValue: description,
                onChanged: (value) {
                  description = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                title: 'Edit',
                isbackgroundcolor: true,
                onPressed: () {
                  editapplication().then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplicationPage(
                                  id: int.parse(widget.id),
                                )));
                  });
                },
              ),
            )
          ],
        ));
  }
}
