import 'dart:convert';
import 'package:app/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<List<Notes>> getNotes() async {
  List<Notes> noteList = [];
  final response = await http.get(Uri.parse('http://10.0.2.2:5000/get'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map<String, dynamic> note in data) {
      // Creating Notes objects from the JSON data and adding them to the noteList
      noteList.add(Notes.fromJson(note));
    }
    return noteList;
  } else {
    return [];
  }
}

postData(String title, String desc) async {
  try {
    var response = await http.post(Uri.parse('http://10.0.2.2:5000/post'),
    // it specifies the type of content being sent in the request especially in form of JSON
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': title, 'desc': desc}));
  } catch (e) {
     Get.snackbar('Error', '$e');
  }
}

updateData(String title, String desc, String id ) async {
  try{
    var response= await http.put(Uri.parse('http://10.0.2.2:5000/update/$id'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'title':title, 'desc':desc}));
    if (response.statusCode == 200) {
     Get.snackbar('Success', 'Note Updated Successfully');
     Get.back();
    } else {
      Get.snackbar('Failed', '${response.statusCode}');
    }
  }catch(e){
   Get.snackbar('Error', '$e');
  }
}

deleteNote(String id) async{
  var response= await http.delete(Uri.parse('http://10.0.2.2:5000/delete/$id'));
  if (response.statusCode==200){
    Get.snackbar('Deleted', 'Note deleted successfully');
  }
}
