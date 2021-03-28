import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/splash_screen.dart';
import './screens/auth_screen.dart';
import './screens/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter chat',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.deepOrange,
        accentColor: Colors.yellow,
        accentColorBrightness: Brightness.light,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.deepOrange,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshots) {
          if(userSnapshots.connectionState == ConnectionState.waiting){
            return SplashScreen();
          }
          if (userSnapshots.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
