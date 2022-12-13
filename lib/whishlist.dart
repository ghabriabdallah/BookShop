import 'package:flutter/material.dart';
import 'package:tunibest/store.dart';
import 'package:tunibest/whishlist.dart';

import 'book.dart';

class whishlist extends StatelessWidget{
  Book book;
  whishlist(this.book);
  List<Book> wisheslist= [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text('Etudiant infos'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          )
      ),
      body: Center(



          child: GestureDetector(
            onTap: (){
              showDialog(
                  builder: (context) => AlertDialog(
                    title: const Text("Remove from wishlist"),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text(
                              "Are you sure you want to remove this book from your wishlist"),
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
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Store()));
                        },
                      ),
                    ],
                  ), context: context
              );
            },
            child: Column(children: [
              Text('nom: ${book.nom}'),
              Text('prix: ${book.prix}'),
            ],),
          ),
        ),
      );

  }
}