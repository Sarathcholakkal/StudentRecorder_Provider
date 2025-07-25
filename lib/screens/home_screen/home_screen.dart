import 'package:flutter/material.dart';
import 'package:studentrecord/controller/theme_provider.dart';
import 'package:studentrecord/utils/const.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    void toggleSwitch(bool value) {
      if (themeChange.darkTheme == false) {
        setState(() {
          themeChange.darkTheme = true;
        });
      } else {
        setState(() {
          themeChange.darkTheme = false;
        });
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Column(
          children: [
            AppBar(
              title: Text("Student Records"),
              centerTitle: true,
              actions: [
                // IconButton(onPressed: () {}, icon: Icon(Icons.grid_on)),
                Switch(onChanged: toggleSwitch, value: themeChange.darkTheme),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 16, color: Colors.black38),
                controller: TextEditingController(),
                textAlignVertical: TextAlignVertical.center,
                decoration: searchInputDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
