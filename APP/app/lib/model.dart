import 'package:mongo_dart/mongo_dart.dart';
class Notes{
  String title;
  String desc;
  Notes({required this.title, required this.desc, });
  // Generates a unique identifier (id) for each Notes object using the ObjectId class from the mongo_dart package.
  var id= ObjectId().toString();

//app ----> mongodb
//Notes object to a JSON format. This is often useful when storing or transmitting data.
  Map<String, dynamic> toJson(){
    return {
      '_id':id,
      'title':title,
      'desc':desc
    };
  }
  //Factory method to create Notes object from json data

  // mongodb --->app
  factory Notes.fromJson(Map<String, dynamic> json){
    return Notes(title: json['title'], desc: json['desc'])..id=json['id'];
  }
}