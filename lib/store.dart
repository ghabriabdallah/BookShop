import 'package:flutter/material.dart';
import 'package:tunibest/book.dart';
import 'package:tunibest/whishlist.dart';

class Store extends StatelessWidget {
   Store({Key? key}) : super(key: key);
  List<Book> liste = [
    Book("test1", "30 DT", AssetImage('img/ab.jpg')),
    Book("test2", "50", AssetImage('img/dh.jpg')),
    Book("test3", "10", AssetImage('img/ab.jpg')),
    Book("test3", "10", AssetImage('img/ab.jpg')),
    Book("test3", "10", AssetImage('img/ab.jpg')),
    Book("test3", "10", AssetImage('img/ab.jpg')),
  ];
  List<Book> whishes =[];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView.separated(
          itemCount: liste.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                         showDialog(
                          builder: (context) => AlertDialog(
                              title: const Text("Add to wishlist"),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                        "Are you sure you want to add this book to your wishlist"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(child: const Text("yes"),
                                  onPressed: () {
                                    whishes.add(liste[index]);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            whishlist(liste[index])));
                                  },
                                ),
                              ],
                          ), context: context
                            );
                          
                        

                /*
                whishes.add(liste[index]);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    whishlist(liste[index])));*/
              },
              child: Container(
                      child: Column(
                        children: [
                          Text(liste[index].nom, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          Image(image: liste[index].image,width: w*0.4, height: h*0.2,),
                          Text(liste[index].prix, style: TextStyle(fontSize: 30,),),
                          Container(
                            child: Container(
                              width: w*0.8,
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
                              child: Center(child: Text("Add to wishlist", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),)),

                            ),
                          ),
                        ],
                      )
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(color: Colors.lightBlue),
        ),

    );
  }
}
