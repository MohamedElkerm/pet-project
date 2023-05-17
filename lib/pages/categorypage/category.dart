import 'package:conditional_builder/conditional_builder.dart';
import 'package:fff/components.dart';
import 'package:fff/helper/constants.dart';
import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/models/categories.dart';
import 'package:fff/pages/categorypage/bird.dart';
import 'package:fff/pages/categorypage/cat.dart';
import 'package:fff/pages/categorypage/dog.dart';
import 'package:fff/pages/categorypage/fish.dart';
import 'package:fff/pages/categorypage/hamster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class category extends StatefulWidget {
  const category({Key key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  void initState() {
    // TODO: implement initState
    getCategories();
    setState(() {
      myCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xffD4D2D2),
        ),
        ListView(children: [
          IconButton(onPressed: (){
            setState(() {
              myCategories;
            });
          }, icon: Icon(Icons.refresh)),
          SizedBox(
            height: 25,
          ),
          ConditionalBuilder(
              condition: myCategories.isNotEmpty,
              builder: (context){
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20.w),
                  itemCount: myCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.87,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                  ),
                  itemBuilder: (context, index) {
                    return buildCategoryCard(myCategories[index]);
                  },
                );
              },
            fallback: (context ,)=>Center(child: CircularProgressIndicator(),),
          ),

          // Expanded(
          //   child: Row(
          //     mainAxisAlignment:MainAxisAlignment.center,
          //     children: [
          //     InkWell(
          //         onTap: () => Navigator.of(context)
          //             .push(MaterialPageRoute(builder: (c) => Dog())),
          //         child: categ(name: "Fish", image: "images/fish.jpg")),
          //   ],),
          // )
        ]),
      ],
    );
  }

  List<Category> myCategories = [];

  getCategories() async {
    print('Start Get Category');
    await DioHelper.getData(
      url: AppEndPoints.getCategories,
      token: globalUser.token,
    ).then((value) {
      print('get Categories');
      print(value.data);
      value.data['categories'].forEach((e) {
        myCategories.add(Category.fromJson(e));
      });
      print(myCategories.length);
      print(myCategories);
      print('get Categories Success');
      setState(() {
        myCategories;
      });
    }).catchError((err) {
      print('get Categories Error');
      print(err.toString());
    });
  }

  Widget buildCategoryCard(Category category) {
    if (category.name == 'Dogs') {
      return InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => Dog(petId: category.id,),
          ),
        ),
        child: categ(
          name: category.name,
          image: category.img,
          context: context,
        ),
      );
    }
    if (category.name == 'Cats') {
      return InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => Cat1(petId: category.id,),
          ),
        ),
        child: categ(
          name: category.name,
          image: category.img,
          context: context,
        ),
      );
    }
    if (category.name == 'Fish') {
      return InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => Fish(petId: category.id,),
          ),
        ),
        child: categ(
          name: category.name,
          image: category.img,
          context: context,
        ),
      );
    }
    return null;
  }
}

/*
          GridView.count(
            childAspectRatio: 0.87,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(20.w),
            crossAxisSpacing: 20,
            mainAxisSpacing: 25,
            crossAxisCount: 2,
            children: [
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Cat1())),
                  child: categ(
                      name: "Cat", image: "images/cat.jpg", context: context)),
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Hamster())),
                  child: categ(
                      name: "Hamster",
                      image: "images/hamaster.jpg",
                      context: context)),
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Dog())),
                  child: categ(
                      name: "Dog", image: "images/dog1.jpg", context: context)),
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Bird())),
                  child: categ(
                      name: "Bird",
                      image: "images/bird.jpg",
                      context: context)),
              InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Fish())),
                child: categ(
                  name: "Fish",
                  image: "images/fish.jpg",
                  context: context,
                ),
              ),
            ],
          ),

 */

/*

            children: [
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Cat1())),
                  child: categ(
                      name: "Cat", image: "images/cat.jpg", context: context)),
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Hamster())),
                  child: categ(
                      name: "Hamster",
                      image: "images/hamaster.jpg",
                      context: context)),
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Dog())),
                  child: categ(
                      name: "Dog", image: "images/dog1.jpg", context: context)),
              InkWell(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => Bird())),
                  child: categ(
                      name: "Bird",
                      image: "images/bird.jpg",
                      context: context)),
              InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Fish())),
                child: categ(
                  name: "Fish",
                  image: "images/fish.jpg",
                  context: context,
                ),
              ),
            ],
 */
