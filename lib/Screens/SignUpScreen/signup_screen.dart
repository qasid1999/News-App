import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/CommonWidgets/eleveted_button.dart';
import 'package:news_app/CommonWidgets/scaffold.dart';
import 'package:news_app/CommonWidgets/text_button.dart';
import 'package:news_app/CommonWidgets/text_field.dart';
import 'package:news_app/Screens/loginScreen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  Future buildalertDailog(String error, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(
            error,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  bool flag = false;
  register() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore database = FirebaseFirestore.instance;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    String username = usernamecontroller.text;
    try {
      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      database.collection("users").doc(user.user.uid).set(
        {
          "email": email,
          "username": username,
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SignInScreen();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        buildalertDailog(
          "The Password Provided is too weak.",
          context,
        );
      } else if (e.code == 'email-already-in-use') {
        buildalertDailog(
          "The email is already in used.",
          context,
        );
      } else {
        buildalertDailog(e.code, context);
      }
    } catch (e) {
      buildalertDailog(e.code.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BuildScaffold(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          width: 330,
          height: 700,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                BuildTextField(
                  hintText: "Username",
                  icon: Icons.person,
                  controller: usernamecontroller,
                  flag: flag,
                ),
                const SizedBox(
                  height: 20,
                ),
                BuildTextField(
                  hintText: "Email",
                  icon: Icons.email,
                  controller: emailcontroller,
                  flag: flag,
                ),
                const SizedBox(
                  height: 20,
                ),
                BuildTextField(
                  hintText: "Password",
                  icon: Icons.vpn_key_sharp,
                  controller: passwordcontroller,
                  flag: flag,
                ),
                const SizedBox(
                  height: 30,
                ),
                BuildElevatedButton(
                  buttonname: "Sign up",
                  onpressed: () {
                    setState(() {
                      flag = true;
                      register();
                    });
                  },
                  padding: 56,
                ),
                const SizedBox(
                  height: 10,
                ),
                BuildTextButton(
                  text: "Already have Account ? Sign in",
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignInScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
