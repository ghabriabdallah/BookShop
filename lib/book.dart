import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Book{
  String nom;
  String prix;
  AssetImage image;

  Book(this.nom, this.prix, this.image);
}