import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();
  final enrollmentNumberController = TextEditingController();
  final facultyNumberController = TextEditingController();
  final mobileController = TextEditingController();

  File? _idProofImage;
  File? _paymentProofImage;

  Future<void> _pickIDProofImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _idProofImage = File(picked.path);
      });
    }
  }

  Future<void> _pickPaymentProofImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _paymentProofImage = File(picked.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate() ||
        _idProofImage == null ||
        _paymentProofImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and upload both images.'),
        ),
      );
      return;
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    final idStorageRef = FirebaseStorage.instance.ref().child(
      'registeredMembers/$timestamp.jpg',
    );
    final paymentStorageRef = FirebaseStorage.instance.ref().child(
      'paymentproof_2025/$timestamp.jpg',
    );

    final idUploadTask = idStorageRef.putFile(_idProofImage!);
    final paymentUploadTask = paymentStorageRef.putFile(_paymentProofImage!);

    final idProofUrl = await (await idUploadTask).ref.getDownloadURL();
    final paymentProofUrl =
        await (await paymentUploadTask).ref.getDownloadURL();
    final rawEmail = emailController.text.trim();

    await FirebaseFirestore.instance
        .collection("members_2025")
        .doc(rawEmail)
        .set({
          "name": nameController.text,
          "email": rawEmail,
          "course": courseController.text,
          "enrollmentNumber": enrollmentNumberController.text,
          "facultyNumber": facultyNumberController.text,
          "mobile": mobileController.text,
          "idProofURL": idProofUrl,
          "paymentProofURL": paymentProofUrl,
          "paymentStatus": false,
        });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Form submitted successfully!')));

    nameController.clear();
    emailController.clear();
    courseController.clear();
    enrollmentNumberController.clear();
    facultyNumberController.clear();
    mobileController.clear();

    setState(() {
      _idProofImage = null;
      _paymentProofImage = null;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    courseController.dispose();
    enrollmentNumberController.dispose();
    facultyNumberController.dispose();
    mobileController.dispose();
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
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: Text(
          'MEMBERSHIP FORM',
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
              buildTextField('Course', courseController),
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
              buildTextField(
                'Mobile Number',
                mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              const SizedBox(height: 12),
              buildImageUploader(
                "Add ID Proof",
                _idProofImage,
                _pickIDProofImage,
              ),

              Column(
                children: [
                  Text(
                    "Scan to Pay",
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontFamily: 'VT323',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyanAccent),
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF1A1A2E),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/qr_code.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),

              buildImageUploader(
                "Add Payment Proof",
                _paymentProofImage,
                _pickPaymentProofImage,
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
