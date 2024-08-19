import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String image;
  final Color backgroundColor;

  CategoryModel({
    required this.title,
    required this.image,
    required this.backgroundColor,
  });
}

final List<CategoryModel> categoriesList = [
  CategoryModel(
    title: "All",
    image: "images/all.png",
    backgroundColor: Colors.green.shade100,
  ),
  CategoryModel(
    title: "Shoes",
    image: "images/shoes.png",
    backgroundColor: Colors.yellow.shade100,
  ),
  CategoryModel(
    title: "Beauty",
    image: "images/beauty.png",
    backgroundColor: Colors.red.shade100,
  ),
  CategoryModel(
    title: "Women",
    image: "images/image1.png",
    backgroundColor: Colors.blue.shade100,
  ),
  CategoryModel(
    title: "Jewelry",
    image: "images/jewelry.png",
    backgroundColor: Colors.orange.shade100,
  ),
  CategoryModel(
    title: "Men",
    image: "images/men.png",
    backgroundColor: Colors.grey.shade100,
  ),
];
