import 'package:flutter/material.dart';

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
