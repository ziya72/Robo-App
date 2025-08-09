import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ComponentForm extends StatefulWidget {
  const ComponentForm({super.key});

  @override
  State<ComponentForm> createState() => _ComponentFormState();
}

class _ComponentFormState extends State<ComponentForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();
  final yearOfStudyController = TextEditingController();
  final enrollmentNumberController = TextEditingController();
  final facultyNumberController = TextEditingController();
  final componentsNameController = TextEditingController();

  File? _idProofImage;

  Future<void> _pickIDProofImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _idProofImage = File(picked.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate() || _idProofImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and upload both images.'),
        ),
      );
      return;
    }
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

      final idStorageRef = FirebaseStorage.instance.ref().child(
        'registeredMembers/$timestamp.jpg',
      );

      final idUploadTask = idStorageRef.putFile(_idProofImage!);

      final idProofUrl = await (await idUploadTask).ref.getDownloadURL();
      final rawEmail = emailController.text.trim();

      await FirebaseFirestore.instance
          .collection("registeredForComponents")
          .doc(rawEmail)
          .set({
            "name": nameController.text,
            "mobileNo": mobileNoController.text,
            "email": rawEmail,
            "course": courseController.text,
            "yearOfStudy": yearOfStudyController.text,
            "enrollmentNumber": enrollmentNumberController.text,
            "facultyNumber": facultyNumberController.text,
            "componentsName": componentsNameController.text,
            "fileUrl": idProofUrl,
            "isIssued": false,
          });

      nameController.clear();
      mobileNoController.clear();
      emailController.clear();
      courseController.clear();
      yearOfStudyController.clear();
      enrollmentNumberController.clear();
      facultyNumberController.clear();
      componentsNameController.clear();

      setState(() {
        _idProofImage = null;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Form submitted successfully!')));
    } catch (e) {
      print('Error during submission: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Submission failed: $e')));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileNoController.dispose();
    emailController.dispose();
    courseController.dispose();
    yearOfStudyController.dispose();
    enrollmentNumberController.dispose();
    facultyNumberController.dispose();
    componentsNameController.dispose();
    super.dispose();
  }

  Widget buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        validator:
            (value) => value == null || value.isEmpty ? 'Required' : null,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'VT323',
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.cyanAccent,
            fontFamily: 'VT323',
            fontSize: 18,
          ),
          filled: true,
          fillColor: Color(0xFF1A1A2E),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget buildImageUploader(
    String label,
    File? imageFile,
    VoidCallback onPick,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.cyanAccent,
            fontFamily: 'VT323',
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A2E),
            border: Border.all(color: Colors.cyanAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              imageFile == null
                  ? Text(
                    'No image selected.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'VT323',
                      fontSize: 18,
                    ),
                  )
                  : Image.file(imageFile),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: onPick,
                child: Text(
                  'Select Image',
                  style: TextStyle(fontFamily: 'VT323'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 2, 2),
        centerTitle: true,
        title: Text(
          'Issue a Component',
          style: TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 14,
            color: Colors.cyanAccent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField('Name', nameController),
              buildTextField(
                'Email',
                emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              buildTextField(
                'Mobile Number',
                mobileNoController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              buildTextField('Course', courseController),
              buildTextField('Year of Study', yearOfStudyController),
              buildTextField(
                'Enrollment Number',
                enrollmentNumberController,
                maxLength: 6,
              ),
              buildTextField(
                'Faculty Number',
                facultyNumberController,
                maxLength: 10,
              ),
              buildTextField('Components Issued', componentsNameController),
              const SizedBox(height: 12),
              buildImageUploader(
                "Add ID Proof",
                _idProofImage,
                _pickIDProofImage,
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: Text(
                    "Submit",
                    style: TextStyle(fontFamily: 'VT323', fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 45),
            ],
          ),
        ),
      ),
    );
  }
}
