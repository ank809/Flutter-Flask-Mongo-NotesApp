import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your Note'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                minLines: 5,
                maxLines: null,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(onPressed: () {
                postData(_titleController.text, _descController.text);
                _descController.clear();
                _titleController.clear();
              }, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }

  postData(String title, String desc) async {
    try {
      var response = await http.post(Uri.parse('http://10.0.2.2:5000/post'),
      headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'title': title, 'desc': desc}));
          print(response.body);

    } catch (e) {
      print(e);
    }
  }
}
