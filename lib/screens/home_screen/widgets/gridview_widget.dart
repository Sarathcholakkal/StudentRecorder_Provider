import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentrecord/model/student.dart';
import 'package:studentrecord/screens/profile_screen/student_profile.dart';

class GridViewWidget extends StatelessWidget {
  final List<Student> students;

  const GridViewWidget({super.key, required this.students});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: students.length,
      itemBuilder: (ctx, index) {
        final student = students[index];
        return GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StudentProfile(student: student),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: student.image != null
                            ? FileImage(File(student.image))
                            : const AssetImage("assets/female.jpg")
                                  as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(student.name, style: const TextStyle(fontSize: 20)),
                Text(student.subject, style: TextStyle()),
                SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      padding: const EdgeInsets.all(5),
    );
  }
}
