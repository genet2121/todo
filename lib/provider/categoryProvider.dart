import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String image;
  Category(this.id, this.name, {required this.image});
}

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [
    Category(1, "General List", image: 'assets/general.png'),
    Category(2, "Wish List", image: 'assets/wishLIst.PNG'),
    Category(3, "Go To List", image: 'assets/gotoList.PNG'),
    Category(4, "Shopping List", image: 'assets/shoping.PNG'),
  ];

  List<Category> get categories => _categories;

  // Add methods to modify categories list if needed
}
