import 'package:flutter/material.dart';
import 'package:recipes/screens/SignupScreen.dart';
import 'package:recipes/widgets/green_button.dart';
import 'package:page_transition/page_transition.dart';

class loginScreens extends StatefulWidget {
  @override
  State<loginScreens> createState() => _loginScreensState();
}

class _loginScreensState extends State<loginScreens> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    padding: EdgeInsets.only(top: 35, left: 30),
                    child: Text(
                      "Welcom",
                      style: TextStyle(
                          fontSize: 46,
                          fontFamily: 'PT_Serif',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 90, left: 55),
                    child: Text(
                      "Back ! ",
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'PT_Serif',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
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
                      controller: emailController,
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
                      controller: passwordController,
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
                const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: GreenButton(width: 349, height: 60, text: "Log In")),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Forget password ?",
                  style: TextStyle(
                      fontFamily: 'PT_Serif',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(90, 145, 95, 0.988)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Dont have an account ? ",
                        style: TextStyle(
                            fontFamily: 'PT_Serif',
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("ok");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScrenn()),
                          );
                          print("okkkk");
                        },
                        child: Text(
                          "Sign Up",
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
        ));
  }
}
