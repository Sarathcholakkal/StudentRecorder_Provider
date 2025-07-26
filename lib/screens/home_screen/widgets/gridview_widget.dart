import 'package:flutter/material.dart';
import 'package:studentrecord/screens/profile_screen/student_profile.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 50,
      itemBuilder: (ctx, index) {
        // final student = filterdList[index];
        return GestureDetector(
          onDoubleTap: () {
            // Navigator.of(
            //   context,
            // ).push(MaterialPageRoute(builder: (context) => StudentProfile()));
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            // student.image != null
                            //     ? FileImage(
                            //         File(student.image))
                            //     :
                            const AssetImage("assets/female.jpg")
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text("Shanidha Ps", style: const TextStyle(fontSize: 20)),
                const Text('Computer Science', style: TextStyle()),
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
