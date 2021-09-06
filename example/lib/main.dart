import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ContactPicker _contactPicker = ContactPicker();
  Contact? _contact;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                color: Colors.blue,
                child: Text("CLICK ME"),
                onPressed: () async {
                  Contact? contact = await _contactPicker.selectContact();
                  log(contact.toString());
                  setState(() {
                    _contact = contact;
                  });
                },
              ),
              Text(
                _contact == null ? 'No contact selected.' : _contact.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
