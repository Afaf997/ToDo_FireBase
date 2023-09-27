// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/SignInPage.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
   TextEditingController forgotpasswordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ForgotPassword Screen"),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 250,
                child: Lottie.asset('animation1.json'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: forgotpasswordcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async{
                     var forgotEmail =forgotpasswordcontroller.text.trim();  
                     try{
                      FirebaseAuth.instance.sendPasswordResetEmail(email:forgotEmail).
                      then((value) =>{
                        print("Email sent"),
                        Get.off(()=>const SignIn()),
                      });

                     }on FirebaseAuthException catch (e){
                      print("Error $e");
                     }
                },
                child: const Text("Forgot password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
