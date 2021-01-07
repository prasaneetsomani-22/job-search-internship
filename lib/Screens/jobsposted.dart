import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_appbar.dart';
import 'package:job_search/widgets/job_card.dart';
import 'package:http/http.dart' as http;

class JobsPosted extends StatefulWidget {
  final String id;
  JobsPosted({this.id});
  @override
  _JobsPostedState createState() => _JobsPostedState();
}

class _JobsPostedState extends State<JobsPosted> {
  List results;

  @override
  void initState() {
    getjobsposted();
    super.initState();
  }

  getjobsposted() async {
    final response =
        await http.post(apiUrls.jobspostedurl, body: {'user_id': widget.id});
    final data = jsonDecode(response.body);
    setState(() {
      results = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Jobs Posted', isbackbutton: true, context: context),
      body: results != null
          ? ListView(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              children: results.map((item) {
                return JobCard(
                  id: widget.id.toString(),
                  jobID: item['job_id'],
                  jobrole: item['role'],
                  company: item['company_name'],
                  location: item['job_location'],
                  lastdate: item['last_date'],
                  description: item['description'],
                );
              }).toList())
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
