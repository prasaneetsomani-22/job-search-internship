import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_search/Screens/searchpage.dart';
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/custom_appbar.dart';
import 'package:job_search/widgets/job_card.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class HomePage extends StatefulWidget {
  final int id;
  HomePage({this.id});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List results;

  @override
  void initState() {
    getjobs();
    print(results);
    super.initState();
  }

  getjobs() async {
    final response = await http.get(apiUrls.getjoburl);
    final data = jsonDecode(response.body);
    setState(() {
      results = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Stack(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Job here....',
                  hintStyle: Constants.textfieldinputstyle,
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                id: widget.id.toString(),
                              )));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              )
            ],
          ),
          shadowColor: Colors.black,
          elevation: 20,
          automaticallyImplyLeading: false,
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        backgroundColor: Color(0xffDCDCDC),
        body: SafeArea(
            child: results != null
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
                : CircularProgressIndicator()));
  }
}
