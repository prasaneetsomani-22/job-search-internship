import 'package:flutter/material.dart';
import 'package:job_search/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final Function onChanged;
  CustomTextField({this.hinttext, this.icon, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextFormField(
        style: Constants.textfieldinputstyle,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hinttext,
            hintStyle: Constants.textfieldinputstyle,
            contentPadding: EdgeInsets.all(18),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          return null;
        },
      ),
    );
  }
}
