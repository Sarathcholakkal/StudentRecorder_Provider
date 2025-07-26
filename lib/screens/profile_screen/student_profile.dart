import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentrecord/model/student.dart';
import 'package:studentrecord/screens/form_screen/update_screen.dart';

class StudentProfile extends StatelessWidget {
  final Student student;

  const StudentProfile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 35),
                  height: 240,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 80,
                        backgroundImage: student.image != null
                            ? FileImage(File(student.image))
                            : const AssetImage("assets/profile.jpg")
                                  as ImageProvider,
                      ),
                      Text(
                        student.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'ID :  ${student.id}',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),

                      InforTileWidget(label: 'Full Name', value: student.name),
                      InforTileWidget(label: 'Subject', value: student.subject),
                      InforTileWidget(label: 'CGPA', value: student.cgpa),
                      InforTileWidget(
                        label: 'Email ID',
                        value: student.emailID,
                      ),
                      InforTileWidget(
                        label: 'Phone Number',
                        value: student.phoneNumber,
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 150,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UpdateScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              horizontal: 150,
                              vertical: 5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Delete",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InforTileWidget extends StatelessWidget {
  final String label;
  final String value;

  const InforTileWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
      child: Column(
        children: [
          Divider(thickness: 1),
          SizedBox(height: 15),
          Row(
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
              SizedBox(width: 35),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  letterSpacing: .7,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
