import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_search/Screens/home.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_appbar.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:job_search/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class PostJobPage extends StatelessWidget {
  final int id;
  PostJobPage({this.id});
  TextEditingController companyctl = TextEditingController();
  TextEditingController rolectl = TextEditingController();
  TextEditingController job_locationctl = TextEditingController();
  TextEditingController last_datectl = TextEditingController();
  TextEditingController descriptionctl = TextEditingController();
  String company_name;
  String role;
  String job_location;
  String last_date;
  String description;
  Map<String, dynamic> result;

  Future<Map<String, dynamic>> getapi(String company_name, String role,
      String job_location, String last_date, String description) async {
    final response = await http.post(apiUrls.joburl, body: {
      'id': id.toString(),
      'company_name': company_name,
      'role': role,
      'job_location': job_location,
      'last_date': last_date,
      'description': description,
    });

    final data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Post Job',
          isbackbutton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_balance),
                      hintText: 'Comapny Name',
                      hintStyle: Constants.textfieldinputstyle,
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    company_name = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Role',
                      hintStyle: Constants.textfieldinputstyle,
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    role = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: 'Job Location',
                      hintStyle: Constants.textfieldinputstyle,
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    job_location = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      hintText: 'Last Date',
                      hintStyle: Constants.textfieldinputstyle,
                      contentPadding: EdgeInsets.all(18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    last_date = value;
                  },
                ),
              ),
              // CustomTextField(hinttext: 'Job Description',icon: Icons.description,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextFormField(
                  maxLines: 100,
                  minLines: 1,
                  style: Constants.textfieldinputstyle,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      alignLabelWithHint: true,
                      hintText: 'Job Description',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  title: 'Post Job',
                  isbackgroundcolor: true,
                  onPressed: () async {
                    result = await getapi(company_name, role, job_location,
                        last_date, description);
                    print(result);
                    if (result['status'] == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      print(result['msg']);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
