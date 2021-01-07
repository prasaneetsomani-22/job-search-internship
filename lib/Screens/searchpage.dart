import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_search/models_and_services/api.dart';
import 'package:job_search/widgets/job_card.dart';
import '../constants.dart';

class SearchPage extends StatefulWidget {
  final String id;
  SearchPage({this.id});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchtext;
  List result = [];

  gettingsearchresults(String searchtext) async {
    final response =
        await http.post(apiUrls.searchjoburl, body: {'text': searchtext});
    final data = jsonDecode(response.body);
    setState(() {
      result = data;
    });
  }

  gettingresults(String searchtext) {
    if (searchtext.length == 0) {
      setState(() {
        result = [];
      });
    } else {
      gettingsearchresults(searchtext);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                autofocus: true,
                style: Constants.textfieldinputstyle,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for Job',
                    hintStyle: Constants.textfieldinputstyle,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  return null;
                },
                onChanged: (value) {
                  searchtext = value;
                  gettingresults(searchtext);
                },
              ),
            )),
        body: result.length == 0
            ? Center(
                child: Text('Search Results',
                    style: Constants.textfieldinputstyle),
              )
            : ListView(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                children: result.map((item) {
                  return JobCard(
                    id: widget.id.toString(),
                    jobID: item['job_id'],
                    jobrole: item['role'],
                    company: item['company_name'],
                    location: item['job_location'],
                    lastdate: item['last_date'],
                    description: item['description'],
                  );
                }).toList()));
  }
}
