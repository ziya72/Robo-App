import 'package:flutter/material.dart';

class ComponentForm extends StatefulWidget {
  const ComponentForm({super.key});

  @override
  State<ComponentForm> createState() => _ComponentFormState();
}

class _ComponentFormState extends State<ComponentForm> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCourse;
  String? selectedYear;

  final courses = ['B.Tech', 'M.Tech'];
  final years = ['1st Year', '2nd Year', '3rd Year', '4th Year'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 0,
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
              buildTextField('Name'),
              buildTextField('Email', keyboardType: TextInputType.emailAddress),
              buildTextField('College'),
              buildDropdown(
                'Course',
                courses,
                (value) => setState(() => selectedCourse = value),
              ),
              buildDropdown(
                'Year of Study',
                years,
                (value) => setState(() => selectedYear = value),
              ),
              buildTextField('Enrollment Number', maxLength: 6),
              buildTextField('Faculty Number', maxLength: 10),
              buildTextField(
                'Mobile Number',
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(fontFamily: 'VT323', fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label, {
    TextInputType? keyboardType,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontFamily: 'VT323',
            fontSize: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
          ),
          filled: true,
          fillColor: Color(0xFF0A0E21),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'VT323',
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buildDropdown(
    String label,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.cyanAccent,
            fontFamily: 'VT323',
            fontSize: 18,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
          ),
          filled: true,
          fillColor: Color(0xFF0A0E21),
        ),
        dropdownColor: Color(0xFF1A1A2E),
        iconEnabledColor: Colors.cyanAccent,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'VT323',
          fontSize: 18,
        ),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
