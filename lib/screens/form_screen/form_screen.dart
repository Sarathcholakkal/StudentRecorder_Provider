import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentrecord/screens/form_screen/textfield_title_widget.dart';
import 'package:studentrecord/utils/email_validator.dart';
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

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _imagePath = _image!.path;
        print('Image Path: ${_image!.path}');
      } else {
        _image = File("assets/profielimage_palceholder.jpg");
        _imagePath = _image!.path;
        print('Image Path: ${_image!.path}');
      }
    });
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
                                        : const AssetImage("a")
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
                          validator: TextValidator(
                            fieldName: 'phone number',
                          ).call,
                        ),
                        SizedBox(height: 30),

                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                horizontal: 100,
                                vertical: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (_signInKey.currentState!.validate()) {
                                debugPrint('form validated');
                                // onSubmittCliked(context);
                              } else {
                                debugPrint("form not vlidated");
                              }
                            },
                            child: const Text(
                              "submit",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
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
