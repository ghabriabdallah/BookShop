import 'package:flutter/material.dart';
import 'package:tunibest/auth_controller.dart';
import 'package:tunibest/firebaseStore.dart';
import 'package:tunibest/store.dart';
import 'myRoutes.dart';
import 'contactUs.dart';
class WelcomePage extends StatelessWidget {
  String email;
   WelcomePage({Key?  key,required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "img/bck2.webp"
                  ),
                  fit: BoxFit.cover,
                )
            ),
            child: Column(
              children: [
                SizedBox(height: h*0.13,),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 60,
                  backgroundImage: AssetImage(
                      "img/logo.jpg"
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 60,),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500]
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FirebaseStore()));
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                        "img/signin.jpg"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(child: Text("Store", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),)),

            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BizCard()));
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                        "img/signin.jpg"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(child: Text("Contact Us", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),)),

            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: (){
              AuthController.instance.logOut();
            },
            child: Container(
              width: w*0.5,
              height: h*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                        "img/signin.jpg"
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(child: Text("Sign out", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white,),)),

            ),
          ),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}
