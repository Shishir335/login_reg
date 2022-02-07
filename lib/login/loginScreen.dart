// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:login_reg/authentication/authentication_service.dart';
import 'package:login_reg/colors.dart';
import 'package:login_reg/register/registerScreen.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(right: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot your password ?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                final provider =
                    Provider.of<AuthenticationService>(context, listen: false);
                provider.login(email: _email.text, password: _password.text);
              },
              child: Padding(
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
                      child: Text('LOGIN',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account ? '),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Register();
              }));
            },
            child: const Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
