import 'package:flutter/material.dart';

const kinputDecoration = InputDecoration(
  hintText: 'Enter your value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const searchInputDecoration = InputDecoration(
  fillColor: Colors.grey,
  contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 3),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Color(0xFFE8D8D8)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Color.fromARGB(255, 29, 31, 31)),
  ),
  errorBorder: InputBorder.none,
  filled: false,
  disabledBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  hintText: 'Search Student',
  prefixIcon: Icon(Icons.search),
  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
);

// const formInputFieldDecoration = InputDecoration(
//   contentPadding: const EdgeInsets.only(left: 20),
//   labelText: 'Name',
//   hintText: 'Enter Your Name',

//   hintStyle: TextStyle(color: Colors.grey[400]),
//   fillColor: Colors.grey.withAlpha(60),
//   filled: true,
//   focusedBorder: const OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10),
//     borderSide: BorderSide(color: Colors.grey.shade400),
//   ),
//   enabledBorder: const OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10),
//     borderSide: BorderSide(color: Colors.grey.shade400),
//   ),
// );
