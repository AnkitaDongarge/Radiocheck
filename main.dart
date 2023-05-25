import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedGender = '';
  bool _isCheckBoxChecked = false;

  void _handleRadioValueChanged(String? value) {
    setState(() {
      _selectedGender = value ?? '';
    });
  }

  void _handleCheckBoxValueChanged(bool? value) {
    setState(() {
      _isCheckBoxChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Radio & Checkbox Example'),
        ),
        body: Column(
          children: [
            ListTile(
              title: const Text('Male'),
              leading: Radio<String>(
                value: 'male',
                groupValue: _selectedGender,
                onChanged: _handleRadioValueChanged,
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio<String>(
                value: 'female',
                groupValue: _selectedGender,
                onChanged: _handleRadioValueChanged,
              ),
            ),
            CheckboxListTile(
              title: const Text('Accept Terms'),
              value: _isCheckBoxChecked,
              onChanged: _handleCheckBoxValueChanged,
            ),
            ElevatedButton(
              onPressed: () {
                print('Selected Gender: $_selectedGender');
                print('Is Checkbox Checked: $_isCheckBoxChecked');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
