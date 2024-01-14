import 'package:app/add_notes.dart';
import 'package:app/func.dart';
import 'package:app/update.dart';
import 'package:flutter/material.dart';
import 'package:app/model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Notes> noteLists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Flask MongoDB CRUD APP",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green.shade400,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            } else {
              noteLists = snapshot.data as List<Notes>;
              return ListView.builder(
                  itemCount: noteLists.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black)),
                      padding: const EdgeInsets.all(20.0),
                      height: 200.0,
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Title ${noteLists[index].title}', style: const TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold ),),
                           const SizedBox(height: 15.0,),
                            Text('Description: ${noteLists[index].desc}',  style: const TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold)),
                            // Text('ID:${noteLists[index].id} ',  style: const TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold)),
                            SizedBox(height:MediaQuery.of(context).size.height*0.003),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  Get.to(UpdateNote(title: noteLists[index].title, desc: noteLists[index].desc, id: noteLists[index].id));
                                }, icon: Icon(Icons.edit, color: Colors.blue.shade900,size: 30.0,)),
                                const SizedBox(width: 1.0,),
                                  IconButton(onPressed: (){
                                   showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(
                                      title: const Text('Are you sure you want to delete'),
                                      actions: [
                                        Row(
                                          children: [
                                            TextButton(onPressed: (){
                                              deleteNote(noteLists[index].id);
                                              setState(() {
                                                noteLists.removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            }, child: const Text('YES')),
                                            TextButton(onPressed: (){
                                          Navigator.of(context).pop();
                                        }, child: const Text('No')),
                                          ],
                                        ),
                                      ],
                                    );
                                   });
                                  }, icon: Icon(Icons.delete, color: Colors.red.shade900,size: 28.0,))
                              ],
                            ),
                          ]),
                    );
                  });
            }
          }),
          floatingActionButton: FloatingActionButton(onPressed: (){
            Get.to(const AddNotes());
          },backgroundColor: Colors.green, 
          child: const Icon(Icons.add, color: Colors.black,),),
    );
  }
}
