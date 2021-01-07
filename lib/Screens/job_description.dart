import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_appbar.dart';
import 'package:job_search/widgets/custom_button.dart';
import 'package:job_search/widgets/job_card.dart';
import 'package:http/http.dart' as http;

class JobDescribtion extends StatefulWidget {
  final String id;
  final String jobID;
  final String jobrole;
  final String company;
  final String location;
  final String lastdate;
  final String description;
  JobDescribtion(
      {this.jobID,
      this.id,
      this.jobrole,
      this.company,
      this.location,
      this.lastdate,
      this.description});

  @override
  _JobDescribtionState createState() => _JobDescribtionState();
}

class _JobDescribtionState extends State<JobDescribtion> {
  int result;
  @override
  void initState() {
    checkappliedstatus().then((data) {
      setState(() {
        result = data['status'];
      });
    });
    super.initState();
  }

  getapplicationstate() async {
    final response = await http
        .post(apiUrls.checkapplicationurl, body: {'id': widget.id.toString()});
    final data = jsonDecode(response.body);
    return data;
  }

  checkappliedstatus() async {
    final response = await http.post(apiUrls.checkapplyjoburl,
        body: {'user_id': widget.id, 'job_id': widget.jobID});
    final data = jsonDecode(response.body);
    return data;
  }

  applyjob() async {
    final response = await http.post(apiUrls.applyjoburl,
        body: {'user_id': widget.id, 'job_id': widget.jobID});
    final data = jsonDecode(response.body);
    print(data['status']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Job Description', isbackbutton: true, context: context),
      body: SafeArea(
        child: ListView(
          children: [
            JobCard(
              jobrole: widget.jobrole,
              company: widget.company,
              location: widget.location,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: CustomButton(
                title: result == 1 ? 'Already Applied' : 'Apply Now',
                isbackgroundcolor: result == 1 ? false : true,
                onPressed: () {
                  getapplicationstate().then((data) {
                    if (data['result'] == null) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Your application is complete.First Complete your application in profile'),
                              actions: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    child: Text('OK'),
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                  ),
                                )
                              ],
                            );
                          });
                    } else {
                      applyjob().then((value) {
                        checkappliedstatus().then((data) {
                          setState(() {
                            result = data['status'];
                          });
                        });
                      });
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text('Job Description',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
