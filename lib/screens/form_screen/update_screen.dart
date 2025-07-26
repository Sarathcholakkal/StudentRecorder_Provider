import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentrecord/controller/student_provider.dart';
import 'package:studentrecord/model/student.dart';
import 'package:studentrecord/screens/form_screen/textfield_title_widget.dart';
import 'package:studentrecord/screens/form_screen/wide_textbutton.dart';
import 'package:studentrecord/utils/email_validator.dart';
import 'package:studentrecord/utils/text_validator.dart';

class UpdateScreen extends StatefulWidget {
  final Student student;

  const UpdateScreen({super.key, required this.student});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  //! varible decleration
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _subjectControler;
  late TextEditingController _cgpaController;
  late TextEditingController _numberController;

  late String _imagePath;
  late int id;
  final GlobalKey<FormState> _signInKey = GlobalKey();
  File? _image;
  final picker = ImagePicker();
  // String? _imagePath;

  //! initlize late variable here

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.student.name);
    _emailController = TextEditingController(text: widget.student.emailID);
    _subjectControler = TextEditingController(text: widget.student.subject);
    _cgpaController = TextEditingController(text: widget.student.cgpa);
    _numberController = TextEditingController(text: widget.student.phoneNumber);
    _imagePath = widget.student.image;
    id = widget.student.id!;

    super.initState();
  }

  //! get image method
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

  //! onsubmit functions

  Future<void> onSubmit(BuildContext ctx) async {
    print('one submitte pressed');
    final name = _nameController.text.trim();
    final emialID = _emailController.text.trim();
    final subject = _subjectControler.text.trim();
    final number = _numberController.text.trim();
    final cgpa = _cgpaController.text.trim();

    final student = Student(
      image: _imagePath,
      name: name,
      emailID: emialID,
      subject: subject,
      cgpa: cgpa,
      phoneNumber: number,
      id: id,
    );
    final studentProvider = Provider.of<StudentProvider>(ctx, listen: false);
    await studentProvider.updateStudent(student);

    print('student updated');
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Student Details"), centerTitle: true),
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
                                    image: FileImage(File(_imagePath)),
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
                          controller: _nameController,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter Stundent Name',
                          ),
                          validator: TextValidator(fieldName: 'Name').call,
                        ),

                        TextFieldTitleWidget(title: "Email ID"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: const InputDecoration().copyWith(
                            hintText: 'Enter Email Address',
                          ),
                          validator: EmailValidator().call,
                        ),
                        TextFieldTitleWidget(title: "Subject"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          controller: _subjectControler,
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
