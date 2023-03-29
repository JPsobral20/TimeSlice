import 'package:flutter/material.dart';


class Product{
  final int id, price;
  final String name, image;
  //final Color color;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    //this.color  = Colors.white,
  });
}

List<Product> products = [
  Product(
    id:1,
    name: "Café",
    price: 20,
    image: "assets/icons/coffee.png",
  ),

  Product(
      id:2,
      name: "Pão",
      price: 30,
      image: "assets/icons/bread.png",
  ),

  Product(
      id:3,
      name: "Donut",
      price: 60,
      image: "assets/icons/donut.png",
  ),

  Product(
      id:4,
      name: "Sopa",
      price: 120,
      image: "assets/icons/soup.png",
  ),

  Product(
      id:5,
      name: "Queque",
      price: 80,
      image: "assets/icons/cupcake.png",
  ),

  Product(
    id:6,
    name: "Chá",
    price: 20,
    image: "assets/icons/tea.png",
  ),

  Product(
    id:7,
    name: "Chupa",
    price: 30,
    image: "assets/icons/lolipop.png",
  ),

  Product(
    id:8,
    name: "Laranja",
    price: 30,
    image: "assets/icons/orange.png",
  ),
];
