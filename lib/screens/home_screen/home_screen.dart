import 'package:flutter/material.dart';
import 'package:studentrecord/controller/screen_view_provider.dart';
import 'package:studentrecord/controller/student_provider.dart';
import 'package:studentrecord/controller/theme_provider.dart';
import 'package:studentrecord/screens/form_screen/form_screen.dart';
import 'package:studentrecord/screens/home_screen/widgets/gridview_widget.dart';
import 'package:studentrecord/screens/home_screen/widgets/listview_widget.dart';
import 'package:studentrecord/utils/const.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<StudentProvider>(context);
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

    return ChangeNotifierProvider(
      create: (_) {
        return ScreenViewProvider();
      },

      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => FormScreen()));
          },
          child: Icon(Icons.add),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "Student Records",
                  style: TextStyle(letterSpacing: 1),
                ),
                centerTitle: true,
                actions: [
                  Consumer<ScreenViewProvider>(
                    builder: (BuildContext context, screenViewProvider, child) {
                      return IconButton(
                        onPressed: () {
                          screenViewProvider.toggleView();
                        },
                        icon: Icon(
                          screenViewProvider.gridView
                              ? Icons.list
                              : Icons.grid_on,
                        ),
                      );
                    },
                  ),

                  Switch(onChanged: toggleSwitch, value: themeChange.darkTheme),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(fontSize: 16),
                  controller: _searchController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: searchInputDecoration,
                  onChanged: (value) {
                    provider.searchStudents(value);
                  },
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Consumer<ScreenViewProvider>(
            builder: (context, screenViewProvider, _) {
              final studentProvider = Provider.of<StudentProvider>(context);
              return screenViewProvider.gridView
                  ? GridViewWidget(students: studentProvider.students)
                  : ListViewWidget(students: studentProvider.students);
            },
          ),
        ),
      ),
    );
  }
}
