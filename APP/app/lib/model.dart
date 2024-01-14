import 'package:mongo_dart/mongo_dart.dart';
class Notes{
  String title;
  String desc;
  var id= ObjectId().toString();
  Notes({required this.title, required this.desc, });

  Map<String, dynamic> toJson(){
    return {
      '_id':id,
      'title':title,
      'desc':desc
    };
  }
  factory Notes.fromJson(Map<String, dynamic> json){
    return Notes(title: json['title'], desc: json['desc'])..id=json['id'];
  }
}