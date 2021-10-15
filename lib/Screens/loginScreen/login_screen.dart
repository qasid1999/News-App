import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/CommonWidgets/eleveted_button.dart';
import 'package:news_app/CommonWidgets/scaffold.dart';
import 'package:news_app/CommonWidgets/text_button.dart';
import 'package:news_app/CommonWidgets/text_field.dart';
import 'package:news_app/Screens/SignUpScreen/signup_screen.dart';
import 'package:news_app/Screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
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

  Future<void> signinwithemail() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    try {
      final UserCredential usercredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        buildalertDailog(
          'No user found for that email',
          context,
        );
      } else if (e.code == 'wrong-password') {
        buildalertDailog(
          "Wrong password provided for that user.",
          context,
        );
      } else if (e.code == 'network-request-failed') {
        buildalertDailog(
          "Network connection Error.Please connect your device with internet",
          context,
        );
      } else {
        buildalertDailog(e.code, context);
      }
    } catch (e) {
      buildalertDailog(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BuildScaffold(
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
                height: 50,
              ),
              BuildTextField(
                hintText: "Email",
                icon: Icons.email,
                controller: emailcontroller,
                flag: flag,
              ),
              const SizedBox(
                height: 10,
              ),
              BuildTextField(
                hintText: "Password",
                icon: Icons.vpn_key_sharp,
                controller: passwordcontroller,
                flag: flag,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BuildTextButton(
                    text: "Forgot Password",
                    onpressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              BuildElevatedButton(
                buttonname: "Login",
                onpressed: () {
                  setState(() {
                    flag = true;
                  });
                  signinwithemail();
                },
                padding: 62,
              ),
              const SizedBox(
                height: 10,
              ),
              BuildTextButton(
                text: "New User ? Sign up",
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
