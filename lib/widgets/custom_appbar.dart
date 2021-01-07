import 'package:flutter/material.dart';

Widget CustomAppBar(
    {bool isbackbutton = false, String title = 'title', BuildContext context}) {
  return AppBar(
    titleSpacing: 20,
    leading: isbackbutton
        ? GestureDetector(
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
          )
        : null,
    shadowColor: Colors.black,
    elevation: 20,
    automaticallyImplyLeading: false,
    toolbarHeight: 75,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
