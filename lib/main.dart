import 'package:flutter/material.dart';
import 'package:flutter_application_1/Add.dart';
// import 'package:flutter_application_1/Home.dart';
//import 'package:flutter_application_1/Show.dart';
import 'package:flutter_application_1/SignUp.dart';
import 'package:flutter_application_1/home2.dart';
import 'package:flutter_application_1/login.dart';
//import 'package:flutter_application_1/product.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/welcome.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome',
      routes: {
        'signup': (context) => SignUpPage(),
        'login': (context) => Login(),
        'Edit': (context) => EditPage(),
        'welcome': (context) => WelcomePage(),
        // 'home':(context)=>Home(),
        // 'show':(context)=>Show(),
        // 'show':(context)=>Show(),
        // 'ADD': (context)=>Addproduct(),
        'ADD': (context) => AddPage(),
        // 'PdfViewerPage': (context)=>PdfViewerPage(),
        'home22': (context) => HomePage(
              username: '',
              email: '',
            ),
      },
      home: SignUpPage(),
    );
  }
}
