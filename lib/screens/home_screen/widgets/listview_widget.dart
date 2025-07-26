import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentrecord/model/student.dart';
import 'package:studentrecord/screens/profile_screen/student_profile.dart';

class ListViewWidget extends StatelessWidget {
  final List<Student> students;

  const ListViewWidget({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StudentProfile(student: student),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: student.image != null
                    ? FileImage(File(student.image))
                    : const AssetImage("assets/male.jpg") as ImageProvider,
              ),
              title: Text(student.name),
              subtitle: Text(student.subject),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
              ),
            ),
          ),
        );
      },
    );
  }
}
