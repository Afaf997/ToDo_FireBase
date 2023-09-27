import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/SignInPage.dart';
import 'package:todo_firebase/Working/signUpworking.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController userphonecontroller = TextEditingController();
  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  User?  CurrentUser =FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'User Name',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: userphonecontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Phone',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: useremailcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  obscureText: true,
                  controller: userpasswordcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.visibility),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: ()async {
                  var username = usernamecontroller.text.trim();
                  var userphone = userphonecontroller.text.trim();
                  var useremail = useremailcontroller.text.trim();
                  var userpassword = userpasswordcontroller.text.trim();

                await  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: useremail, password: userpassword)
                      .then((value) => {  print("user created"), signUpUser(
                        username,userphone,useremail,userpassword
                      ),
                          });
                },
                child: const Text("Sign Up"),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignIn());
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Already have an account signIn"),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
