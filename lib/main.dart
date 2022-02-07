import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_reg/authentication/authentication_service.dart';
import 'package:login_reg/colors.dart';
import 'package:login_reg/homeScreen/home_screen.dart';
import 'package:login_reg/widgets.dart';
import 'package:provider/provider.dart';

import 'login/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) {
            context.read<AuthenticationService>().authStateChanges;
          },
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Login Registration',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AnimatedSplashScreen(
            splash: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    firstColor,
                    secondColor,
                  ],
                )),
                child: Center(child: logo())),
            backgroundColor: Colors.white,
            splashIconSize: double.infinity,
            duration: 500,
            nextScreen: const AuthenticationWrapper()),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<AuthenticationService>(context, listen: false);
    // ignore: unnecessary_null_comparison
    if (firebase != null) {
      return const HomePage();
    } else {
      return const Login();
    }
  }
}
