import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/SignInPage.dart';
import 'package:todo_firebase/createnotes.dart';
import 'package:todo_firebase/edit.dart';

class HomescreenPage extends StatefulWidget {
  const HomescreenPage({super.key});

  @override
  State<HomescreenPage> createState() => _HomescreenPageState();
}

class _HomescreenPageState extends State<HomescreenPage> {
  User? userid = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        backgroundColor: Colors.purple,
        actions: [
          GestureDetector(
            onTap: () {
              Get.off(
                () => const SignIn(),
              );
            },
            child: const Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notes')
                .where("userid", isEqualTo: userid?.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("soething wont wrong");
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Text("No data found!");
              }
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var note =snapshot.data!.docs[index]['note'];
                      var docId = snapshot.data!.docs[index].id;
                      // var noteId =snapshot.data!.docs[index]['user id'];
                      return  Card(
                        child: ListTile(
                        
                          title: Text(note),
                          // subtitle:Text(noteId) ,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.to(()=>const EditNoteScreen(),
                                  arguments:{
                                       "note" :note,
                                       "docId" :docId,
                                  },
                                   );
                                },
                                child:const Icon(Icons.edit)),
                              const SizedBox(width: 10.0,),
                              GestureDetector(
                                onTap: ()async{
                                 await FirebaseFirestore.instance.collection("notes").doc(docId).delete();
                                },
                                child: const Icon(Icons.delete),
                                ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Container();

            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreateNoteScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
