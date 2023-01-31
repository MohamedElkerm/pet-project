import 'package:fff/components.dart';
import 'package:fff/dog.dart';
import 'package:fff/pages/shop/pet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: Colors.grey[400]),
      GridView.count(
        //  primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 19,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Dog())),
                child: categ(name: "Cat", image: "images/cat.jpg")),
            InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Dog())),
                child: categ(name: "Hamster", image: "images/cat.jpg")),
            InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Dog())),
                child: categ(name: "Dog", image: "images/cat.jpg")),
            InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Dog())),
                child: categ(name: "Bird", image: "images/cat.jpg")),
            InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Dog())),
                child: categ(name: "Fish", image: "images/cat.jpg")),
          ])
    ]);
  }
}
