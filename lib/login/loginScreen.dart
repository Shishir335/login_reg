// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:login_reg/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: Colors.orange,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(110)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      firstColor,
                      secondColor,
                    ],
                  )),
              child: Stack(
                children: [
                  Center(child: logo()),
                  const Positioned(
                      bottom: 60,
                      right: 40,
                      child: Text('Login',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ],
              ),
            ),
            const SizedBox(height: 40),
            textField(_email, 'Email', const Icon(Icons.email)),
            const SizedBox(height: 30),
            textField(_password, 'Password', const Icon(Icons.vpn_key_rounded)),
          ],
        ));
  }

  Padding textField(
      TextEditingController controller, String hintText, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 3),
                  spreadRadius: 3)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 15, left: 25),
                  hintText: hintText,
                  border: InputBorder.none,
                  prefixIcon: icon)),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(color: Colors.white, width: 5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bar(),
          const SizedBox(height: 5),
          bar(),
          const SizedBox(height: 5),
          bar(),
        ],
      ),
    );
  }

  Widget bar() {
    return Container(
      height: 10,
      width: 60,
      transform: Matrix4.rotationZ(-.35),
      transformAlignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    );
  }
}
