import 'package:flutter/material.dart';
import 'package:tunibest/contactUs.dart';
import 'package:tunibest/login_page.dart';



class MyRoutes extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Named Routes demo',
      initialRoute: '/',
      routes: {
        '/loginPage':(context) => LoginPage(),
        '/contactUs': (context) => BizCard()
      },
    );
  }
}