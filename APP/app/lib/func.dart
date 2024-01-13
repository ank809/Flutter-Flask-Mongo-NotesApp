import 'dart:convert';

import 'package:app/model.dart';
import 'package:http/http.dart' as http;

Future<List<Notes>> getNotes() async {
  List<Notes> noteList=[];
  final response= await http.get(Uri.parse('http://10.0.2.2:5000/get'));
  var data= jsonDecode(response.body.toString());
  if (response.statusCode==200){
    for (Map<String, dynamic> note in data){
      // Creating Notes objects from the JSON data and adding them to the noteList
      noteList.add(Notes.fromJson(note));
    }
     return noteList;
  }
  else{
    return [];
  }
  }
