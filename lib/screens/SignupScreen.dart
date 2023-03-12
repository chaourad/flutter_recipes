import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipes/Models/User_model.dart';
import 'package:recipes/widgets/green_button.dart';
import 'package:http/http.dart' as http;

class SignupScrenn extends StatefulWidget {
  const SignupScrenn({super.key});

  @override
  State<SignupScrenn> createState() => _SignupScrennState();
}



class _SignupScrennState extends State<SignupScrenn> {
  User? _users;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  Future<User?> createUser(String nom, String email, String password) async {
  final String apiUrl = "http://localhost:8080/api/v1/auth/register";
  final response = await http.post(Uri.parse(apiUrl),
      body:
          jsonEncode({"firstname": nom, "email": email, "password": password}));
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return userFromJson(responseString);
  } else {
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    child: Image.asset("assets/test1.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 35, left: 47),
                    child: Text(
                      "Create",
                      style: TextStyle(
                          fontFamily: 'PT_Serif',
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(top: 80, left: 35),
                    child: Text(
                      "Account  ",
                      style: TextStyle(
                          fontFamily: 'PT_Serif',
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 349,
                    height: 30,
                    child: Row(
                      children: [
                        Text("Username",
                            style: TextStyle(
                                fontFamily: 'PT_Serif',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 349,
                  height: 60,
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "Enter Your Username",
                    labelStyle: const TextStyle(
                      fontFamily: 'PT_Serif',
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(237, 241, 214, 3),
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: Colors.black45,
                    ),
                    border: myinputborder(), //normal border

                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //focused border
                    // set more border style like disabledBorder
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 349,
                    height: 30,
                    child: Row(
                      children: [
                        Text("Email",
                            style: TextStyle(
                                fontFamily: 'PT_Serif',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 349,
                  height: 60,
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    labelStyle: const TextStyle(
                      fontFamily: 'PT_Serif',
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(237, 241, 214, 3),
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.black45,
                    ),
                    border: myinputborder(), //normal border

                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //focused border
                    // set more border style like disabledBorder
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 349,
                    height: 30,
                    child: Row(
                      children: [
                        Text("Password",
                            style: TextStyle(
                                fontFamily: 'PT_Serif',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 349,
                  height: 60,
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "Enter Your Password",
                    labelStyle: const TextStyle(
                      fontFamily: 'PT_Serif',
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(237, 241, 214, 3),
                    prefixIcon: const Icon(
                      Icons.password_rounded,
                      color: Colors.black45,
                    ),
                    border: myinputborder(), //normal border

                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //focused border
                    // set more border style like disabledBorder
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  //w 349 , h 60
                  child: InkWell(
                      onTap: () async {
                        final String name = usernameController.text;
                        final String email = emailController.text;
                        final String password = passwordController.text;

                        final User? user =
                            await createUser(name, email, password);
                        setState(() {
                          _users = user!;
                        });
                      },
                      child: const GreenButton(
                          width: 349, height: 60, text: "Sign Up")),
                ),
                const SizedBox(
                  height: 30,
                ),
                _users == null
                    ? Container()
                    : Text("The user ${_users!.firstname} is creted suceful "),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Already have an account ? ",
                        style: TextStyle(
                            fontFamily: 'PT_Serif',
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("ok");
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontFamily: 'PT_Serif',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color.fromRGBO(90, 145, 95, 0.988)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromRGBO(90, 145, 95, 0.988),
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromRGBO(90, 145, 95, 0.988),
          width: 3,
        ));
  }
}
