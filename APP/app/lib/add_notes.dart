import 'package:app/func.dart';
import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor:  Colors.green,
      appBar: AppBar(
        title: const Text('Add your Note'),
        backgroundColor: Colors.green.shade400,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0))),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: const TextStyle(
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
                Get.to(HomeScreen());
              }, child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
