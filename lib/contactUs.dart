import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BizCard extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        _getCard(),
                        _getCircleAvatar(),
                      ],
                    )
                ),
                SizedBox(height: 30,),
                Container(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        _getCardd(),
                        _getCircleAvatarr(),
                      ],
                    )
                ),
              ],
            ),
    );
  }




















  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Abdallah Ghabri",style: TextStyle(fontSize: 30,color: Colors.white)),
            Text("Etudiant à Iset Béja",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mail),
                Text("abdallah.ghabri@outlook.fr",style: TextStyle(fontSize: 15)),
              ],
            ),
          ]
      ),
    );
  }
  Container _getCardd() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.redAccent),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dhia Borji",style: TextStyle(fontSize: 30,color: Colors.white)),
            Text("Etudiant à Iset Béja",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mail),
                Text("dhia.borji2001@gmail.com",style: TextStyle(fontSize: 15)),
              ],
            ),
          ]
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: Colors.white, width: 1),
        image: DecorationImage(
            image: AssetImage('images/pdp.jpg'), fit: BoxFit.cover
        ),
      ),
    );
  }
  Container _getCircleAvatar() {
    return Container(
        child: CircleAvatar(
          backgroundImage: AssetImage('img/ab.jpg'), radius: 50,
        ));
  }
  Container _getCircleAvatarr() {
    return Container(
        child: CircleAvatar(
          backgroundImage: AssetImage('img/dh.jpg'), radius: 50,
        ));
  }



}