import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/SignInPage.dart';

signUpUser(
  String username,
  String userphone,
  String useremail,
  String userpassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      'userName': username,
      'userPhone': userphone,
      'userEmail': useremail,
      'userPassword': userpassword,
      'createAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) => {
      FirebaseAuth.instance.signOut(),
      Get.to(() =>const SignIn()),
      });
  } on FirebaseAuthException catch (e) {
    print("Error $e");
  }
}
