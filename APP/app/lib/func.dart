import 'dart:convert';

import 'package:app/model.dart';
import 'package:http/http.dart' as http;

Future<List<Notes>> getNotes() async {
  List<Notes> noteList=[];
  final response= await http.get(Uri.parse('http://10.0.2.2:5000/get'));
  var data= jsonDecode(response.body.toString());
  if (response.statusCode==200){
    for (Map<String, dynamic> index in data){
      noteList.add(Notes.fromJson(index));
    }
     return noteList;
  }
  else{
    return [];
  }
  }