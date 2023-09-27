import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/forgotpass.dart';
import 'package:todo_firebase/homescreen.dart';
import 'package:todo_firebase/signUpPage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login Screen"),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 300,
                child: Lottie.asset('animation1.json'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffix: Icon(Icons.visibility),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  navigator?.push(MaterialPageRoute(builder: (context)=>const HomescreenPage()));

                },
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ForgotPasswordScreen());
                },
                child: Container(
                  child: const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Forgot password"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
         
              GestureDetector(
                onTap: (){
                  Get.to(()=> const SignUp());
                },
                child: Container(
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Don't have an account signup"),
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
