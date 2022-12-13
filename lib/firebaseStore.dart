import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FirebaseStore extends StatefulWidget {
  const FirebaseStore({Key? key}) : super(key: key);

  @override
  State<FirebaseStore> createState() => _FirebaseStoreState();
}

class _FirebaseStoreState extends State<FirebaseStore> {

  final CollectionReference _books =
      FirebaseFirestore.instance.collection('books');
  /*
  await _books.add({"name": name, "price": price});
   await _books.update({"name": name, "price": price});
  await _books.doc(productId).delete();
   */

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async{
    if (documentSnapshot != null){
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'];
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx){
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration:  const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price'
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('update'),
                onPressed: () async {
                  final String name = _nameController.text;
                  final String price = _priceController.text;

                  if(price != null){
                    await _books
                        .doc(documentSnapshot!.id)
                        .update({"name": name, "price": price});
                    _nameController.text= '';
                    _priceController.text= '';
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      }
    );

  }
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async{
    if (documentSnapshot != null){
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx){
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration:  const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                      labelText: 'Price'
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  child: const Text('update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String price = _priceController.text;

                    if(price != null){
                      await _books.add({"name":name, "price": price});
                      _nameController.text= '';
                      _priceController.text= '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        }
    );

  }
  Future<void> _delete(String productId) async{
    await _books.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("You have successfuly deleted this book"),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: _books.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index){
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(icon: const Icon(Icons.edit),
                          onPressed: () => _update(documentSnapshot),

                          ),
                          IconButton(icon: const Icon(Icons.delete),
                            onPressed: () => _delete(documentSnapshot.id),

                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
