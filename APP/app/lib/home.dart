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
        ),
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
                    return InkResponse(
                      onTap: () {
                        Get.to(UpdateNote());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black)),
                        padding: const EdgeInsets.all(20.0),
                        height: 200.0,
                        margin: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Title ${noteLists[index].title}', style: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold ),),
                             const SizedBox(height: 15.0,),
                              Text('Description: ${noteLists[index].desc}',  style: TextStyle(fontSize: 18.0, fontWeight:FontWeight.bold)),
                            ]),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
