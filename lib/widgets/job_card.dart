import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_search/Screens/job_description.dart';

class JobCard extends StatelessWidget {
  final String id;
  final String jobID;
  final String jobrole;
  final String company;
  final String location;
  final String lastdate;
  final String description;
  JobCard(
      {this.id,
      this.jobID,
      this.jobrole,
      this.company,
      this.location,
      this.lastdate,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JobDescribtion(
                        id: id,
                        jobID: jobID,
                        jobrole: jobrole,
                        company: company,
                        location: location,
                        lastdate: lastdate,
                        description: description,
                      )));
        },
        child: Container(
            padding: EdgeInsets.only(left: 30),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 4),
                  child: Text(
                    jobrole,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        width: 70,
                        height: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(company,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(location,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
