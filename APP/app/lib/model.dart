
class Notes{
  String title;
  String desc;
  Notes({required this.title, required this.desc});

  Map<String, dynamic> toJson(){
    return {
      'title':title,
      'desc':desc
    };
  }
  factory Notes.fromJson(Map<String, dynamic> json){
    return Notes(title: json['title'], desc: json['d']);
  }
}