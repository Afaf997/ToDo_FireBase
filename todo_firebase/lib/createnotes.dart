import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_sorted_list.dart';
import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController notescontroller =TextEditingController();

  User? userid =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:const Text("create notes"),
        backgroundColor: Colors.purple,
       ),
       body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                maxLines: null,
                controller: notescontroller,
                decoration: const InputDecoration(
                  hintText: "Add notes"  ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: ()async{
              var note=notescontroller.text.trim();
              User? userid =FirebaseAuth.instance.currentUser;
              if (note != ""){
                try{
                await  FirebaseFirestore.instance.collection("notes").doc(userid?.uid).set({
                         "createdAt":DateTime.now(),
                          "note":note,
                          "userid" : userid?.uid,
                  });
                }catch(e){
                  print("Error $e");
                }
              }
                  
               
            }, 
            child:const Text("Add notes"),)
          ],
        ),
       ),
    );
  }
} 