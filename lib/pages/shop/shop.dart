import 'package:carousel_pro/carousel_pro.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fff/helper/constants.dart';

import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/helper/snack_helper.dart';
import 'package:fff/models/cart_item.dart';
import 'package:fff/models/products.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/signup.dart';

class shop extends StatefulWidget {
  const shop({Key key}) : super(key: key);

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  // Define a variable to store the recommended user
  String recommendedUser;

// Define a variable to store the message visibility
  bool showMessage = false;

// Define a method to get the recommended user from an API or database
  Future<String> getRecommendedUser() async {
// Replace this with your own logic to get the recommended user
    return "Alice";
  }

// Define a method to show a message with the recommended user
  void showMessageWithUser(String user) {
    setState(() {
// Set the message visibility to true
      showMessage = true;
// Set the recommended user to the state variable
      recommendedUser = user;
    });
// Hide the message after 5 seconds using another setState call
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        showMessage = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts(50);
    getMyCart();
// Call the getRecommendedUser method after 10 seconds of entering the page
    Future.delayed(const Duration(seconds: 1), () async {
// Get the recommended user and store it in a local variable
      String user = await getRecommendedUser();
// Show a message with the recommended user using another method
      showMessageWithUser(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            showMessage = false;
          });
          return getProducts(50);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffD4D2D2),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // if (showMessage)
                ConditionalBuilder(
                  condition: showMessage && recommendation!=null,
                  builder:(context)=> Center(
                    child: Container(
                      width: 250,
                      height: 220,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Image(
                                  image: NetworkImage(
                                      '${AppEndPoints.imageBaseURL}${recommendation.img}'),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 140,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 5,
                                child: IconButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      setState(() {
                                        showMessage = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 50,
                                    )),
                              ),
                            ],
                          ),
                          Center(
                              child: Text(
                            recommendation.title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Text(recommendation.price.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  fallback: (context)=>SizedBox(),
                ),
                Container(
                  height: 220.h,
                  width: double.infinity,
                  child: Carousel(
                    images: [
                      AssetImage("images/7.png"),
                      AssetImage("images/8.jpg"),
                      AssetImage("images/fish.jpg"),
                      AssetImage("images/dog1.jpg"),
                      AssetImage("images/bird.jpg"),
                    ],
                    dotSize: 4,
                    dotIncreaseSize: 2,
                    dotBgColor: Colors.white12,
                  ),
                ),
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    clipBehavior: Clip.hardEdge,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 330.h,
                        maxCrossAxisExtent: 285,
                        childAspectRatio: 2.76 / 5,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) => Container(
                      width: 200.w,
                      height: 150.h,
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 7,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    '${AppEndPoints.imageBaseURL}${myProducts[index].img}',
                                    height: 150.h,
                                    width: 180.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Text(
                                      myProducts[index].title.toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 5.h),
                                Text(myProducts[index].stock.toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text(myProducts[index].price,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    //
                                    // IconButton(
                                    //   onPressed: () {
                                    //
                                    //     // setState(() {
                                    //     //   data[index]["cart"] =
                                    //     //   !data[index]["cart"];
                                    //     //   data[index]["cart"] == false
                                    //     //       ? cartdereaseCount()
                                    //     //       : cartItemCount();
                                    //     // });
                                    //   },
                                    //   // icon: data[index]["cart"] == false
                                    //   //     ? Icon(
                                    //   //   Icons.shopping_cart_outlined,
                                    //   //   size: 35,
                                    //   // )
                                    //   //     : Icon(
                                    //   //   Icons.add_shopping_cart_outlined,
                                    //   //   color: Colors.green,
                                    //   //   size: 35,
                                    //   // ),
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MaterialButton(
                                          minWidth: 25,
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            // setState(() {
                                            //   data[index]["id"] = !data[index]["id"];
                                            //   data[index]["id"] == false
                                            //       ? favIncreaseCount()
                                            //       : favDereasCount();
                                            // });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 40,
                                          )),
                                      MaterialButton(
                                          minWidth: 25,
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            addToCart(myProducts[index].id);
                                          },
                                          child: Icon(
                                            Icons
                                                .shopping_cart_checkout_outlined,
                                            color: Colors.red,
                                            size: 40,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: myProducts.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            getProducts(1);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Dog',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            getProducts(2);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cat',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            getProducts(3);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Fish',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Bird',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Hamster',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ));
        },
        child: Icon(Icons.category_outlined),
        backgroundColor: Color(0xff182747),
      ),
    ));
  }

  List<Recommendation> myProducts = [];

  Recommendation recommendation ;

  getProducts(int categoryId) async {
    myProducts.clear();
    print('getProducts');
    await DioHelper.getData(
      url: AppEndPoints.products,
    ).then((value) {
      if (categoryId == 50) {
        value.data['products'].forEach((e) {
          myProducts.add(Recommendation.fromJson(e));
        });
        recommendation = Recommendation.fromJson(value.data['recommendation']);
        print(recommendation);
      }
      // TODO : add your category with your id
      if (categoryId == 1) {
        value.data['products'].forEach((e) {
          if (e['category_id'] == 1) myProducts.add(Recommendation.fromJson(e));
        });
      }
      if (categoryId == 2) {
        value.data['products'].forEach((e) {
          if (e['category_id'] == 2) myProducts.add(Recommendation.fromJson(e));
        });
      }
      if (categoryId == 3) {
        value.data['products'].forEach((e) {
          if (e['category_id'] == 3) myProducts.add(Recommendation.fromJson(e));
        });
      }
      if (categoryId == 4) {
        value.data['products'].forEach((e) {
          if (e['category_id'] == 4) myProducts.add(Recommendation.fromJson(e));
        });
      }
      if (categoryId == 5) {
        value.data['products'].forEach((e) {
          if (e['category_id'] == 5) myProducts.add(Recommendation.fromJson(e));
        });
      }

      print(myProducts.length);
      setState(() {
        myProducts;
      });
    }).catchError((err) {});
  }

  getMyCart() async {
    print('start get my cart');
    await DioHelper.getData(
      url: AppEndPoints.getMyCart,
      token: globalUser.token,
    ).then((value) {
      value.data['cartItems'].forEach((e) {
        CartItemsForBadges.add(CartItem.fromJson(e));
      });
      setState(() {
        CartItemsForBadges;
      });
    }).catchError((err) {
      showSnackBar(
          context: context, text: 'Erro in get My Cart', clr: Colors.red);
    });
  }

  addToCart(product_id) async {
    DioHelper.postData(
      url: AppEndPoints.addToCart,
      data: {
        "product_id": product_id,
      },
      token: globalUser.token,
    ).then((value) {
      showSnackBar(context: context, text: 'add success', clr: Colors.green);
      getMyCart();
    }).catchError((err) {
      showSnackBar(context: context, text: 'Try Again', clr: Colors.red);
      print(err.toString());
    });
  }
}
