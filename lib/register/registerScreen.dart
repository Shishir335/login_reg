// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _PhoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Text('Register',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ],
            ),
          ),
          const SizedBox(height: 40),
          textField(_fullName, 'Fullname', const Icon(Icons.person)),
          const SizedBox(height: 20),
          textField(_email, 'Email', const Icon(Icons.email)),
          const SizedBox(height: 20),
          textField(_PhoneNumber, 'Phone Number', const Icon(Icons.phone)),
          const SizedBox(height: 20),
          textField(_password, 'Password', const Icon(Icons.vpn_key_rounded)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        secondColor,
                        firstColor,
                      ],
                    )),
                child: const Center(
                  child: Text('REGISTER',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                )),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already a member ? '),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Register();
              }));
            },
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Login',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
