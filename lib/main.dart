import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentrecord/controller/student_provider.dart';
import 'package:studentrecord/controller/theme_provider.dart';
import 'package:studentrecord/db/db_services.dart';
import 'package:studentrecord/screens/flash_screen.dart';
import 'package:studentrecord/utils/theme_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.database;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();
  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.themePreference
        .getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => themeChangeProvider,
        ),
        ChangeNotifierProvider<StudentProvider>(
          create: (context) => StudentProvider()..fetchStudents(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, child) {
          return MaterialApp(
            title: 'Dark Theme',
            debugShowCheckedModeBanner: false,
            theme: ThemeColor.themeData(value.darkTheme, context),
            home: Flash_Screen(),
          );
        },
      ),
    );
  }
}
