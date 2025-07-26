import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentrecord/controller/student_provider.dart';
import 'package:studentrecord/model/student.dart';
import 'package:studentrecord/screens/form_screen/textfield_title_widget.dart';
import 'package:studentrecord/screens/form_screen/wide_textbutton.dart';
import 'package:studentrecord/screens/profile_screen/student_profile.dart';
import 'package:studentrecord/utils/email_validator.dart';
import 'package:studentrecord/utils/phone_number_validator.dart';
import 'package:studentrecord/utils/text_validator.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameContorller = TextEditingController();
  final _emalilController = TextEditingController();
  final _subjectController = TextEditingController();
  final _numberController = TextEditingController();
  final _cgpaController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey();
  File? _image;
  final picker = ImagePicker();
  String? _imagePath;
  //!  fun helps to fetch device media image
  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _imagePath = _image!.path;
        print('Image Path: ${_image!.path}');
      } else {
        _image = File("assets/female.jpg");
        _imagePath = _image!.path;
        print('Image Path: ${_image!.path}');
      }
    });
  }
  // ! help to clear text field

  void clearField() {
    _nameContorller.clear();
    _emalilController.clear();
    _subjectController.clear();
    _numberController.clear();
    _cgpaController.clear();
    setState(() {
      _imagePath = null;
    });
  }
  // ! onsubmitted fun for create instace of student using  input field

  Future<void> onSubmit(BuildContext ctx) async {
    print('one submitte pressed');
    final name = _nameContorller.text.trim();
    final emialID = _emalilController.text.trim();
    final subject = _subjectController.text.trim();
    final number = _numberController.text.trim();
    final cgpa = _cgpaController.text.trim();
    if (_imagePath != null) {
      final student = Student(
        image: _imagePath!,
        name: name,
        emailID: emialID,
        subject: subject,
        cgpa: cgpa,
        phoneNumber: number,
      );
      final studentProvider = Provider.of<StudentProvider>(ctx, listen: false);
      await studentProvider.addStudent(student);

      print('student added');
      Navigator.of(context).pop();

      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (ctx) {
      //       return const StudentProfile();
      //     },
      //   ),
      // );
      clearField();
      // getAllStudent();
    } else {
      showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            title: const Text('Please insert profile picture'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text('close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student Details"), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Form(
                    key: _signInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image:
                                        _imagePath != null &&
                                            File(_imagePath!).existsSync()
                                        ? FileImage(File(_imagePath!))
                                        : const AssetImage("assets/female.jpg")
                                              as ImageProvider,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: IconButton(
                                  onPressed: () {
                                    getImage();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        TextFieldTitleWidget(title: "Name"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          controller: _nameContorller,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter Stundent Name',
                          ),
                          validator: TextValidator(fieldName: 'Name').call,
                        ),

                        TextFieldTitleWidget(title: "Email ID"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emalilController,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter Email Address',
                          ),
                          validator: EmailValidator().call,
                        ),
                        TextFieldTitleWidget(title: "Subject"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          controller: _subjectController,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter Subject',
                          ),
                          validator: TextValidator(fieldName: 'subject').call,
                        ),
                        TextFieldTitleWidget(title: "CGPA"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          controller: _cgpaController,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter CGPA',
                          ),
                          validator: TextValidator(fieldName: 'CGPA').call,
                        ),
                        TextFieldTitleWidget(title: "Phone Number"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          controller: _numberController,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter Phone Number',
                          ),
                          validator: PhoneNumberValidator(
                            fieldName: 'phone number',
                          ).call,
                        ),
                        SizedBox(height: 30),

                        WideTextButtonWidget(
                          signInKey: _signInKey,
                          onsubmit: onSubmit, // ✅ correct way to pass
                        ),
                      ],
                    ),
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
