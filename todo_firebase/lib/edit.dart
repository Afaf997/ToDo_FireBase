import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController editnotecontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Notes"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: editnotecontroller,
            ),
            ElevatedButton(onPressed: (){},
             child: Text("Update"))
          ],
        ),
      ),
    );
  }
}