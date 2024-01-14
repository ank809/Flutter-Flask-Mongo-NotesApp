import 'package:app/func.dart';
import 'package:flutter/material.dart';

class UpdateNote extends StatefulWidget {
  String title;
  String desc;
  String id;
  UpdateNote({ super.key,  required this.title, required  this.desc, required this.id}){}

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  final TextEditingController _titleController= TextEditingController();
  final TextEditingController _descController= TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text= widget.title ;
    _descController.text= widget.desc;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Note', style: TextStyle(color: Colors.black),), backgroundColor: Colors.green.shade100,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30.0,),
              TextFormField(
                 controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                  border: OutlineInputBorder(),
                ),
                minLines: 3,
                maxLines: 5,
              ),
              ElevatedButton(onPressed: (){
                updateData(_titleController.text, _descController.text, widget.id);
              }, child: const Text('Update Note'))
            ],
          ),
        ),
      ),
    );
  }
}