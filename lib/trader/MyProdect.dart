import 'package:conditional_builder/conditional_builder.dart';
import 'package:fff/helper/constants.dart';
import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/helper/snack_helper.dart';
import 'package:fff/models/products.dart';
import 'package:fff/trader/AddProdect.dart';
import 'package:fff/trader/edithome1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProdect extends StatefulWidget {
  var Pname;
  var Pprice;
  var Pcount;
  var Pimage;

  MyProdect({
    Key key,
    this.dataone,
    this.datatwo,
    this.datathree,
    this.datafour,
    this.Pname,
    this.Pprice,
    this.Pcount,
    this.Pimage,
  }) : super(key: key);

  var dataone;
  var datatwo;
  var datathree;
  var datafour;

  @override
  State<MyProdect> createState() => _MyProdectState();
}

class _MyProdectState extends State<MyProdect> {
  List trad = [
    {
      "image": "images/cat.jpg",
      "name": "fish",
      "price": "250",
      "number of scales": "10"
    },
    {
      "image": "images/dog1.jpg",
      "name": "cat",
      "price": "150",
      "number of scales": "10"
    },
    {
      "image": "images/cat.jpg",
      "name": "dog",
      "price": "200",
      "number of scales": "10"
    },
    {
      "image": "images/cat.jpg",
      "name": "pet",
      "price": "330",
      "number of scales": "10"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    getMyProducts();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "My_Prodect",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              color:myProducts.length==0?Colors.transparent:Color(0xffD4D2D2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         IconButton(
                    //             onPressed: () {
                    //               Navigator.of(context).push(
                    //                   MaterialPageRoute(builder: (c) => AddProdect()));
                    //             },
                    //             icon: Icon(
                    //               Icons.add_circle_outline,
                    //               size: 30,
                    //             )),
                    //         Text(
                    //           "Add prodect",
                    //           style:
                    //               TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                    //         )
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 6, bottom: 6),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: ConditionalBuilder(
                          condition: myProducts.isNotEmpty,
                          builder:(context)=>ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount:3,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 250.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    widget.datafour != null
                                                        ? Container(
                                                            width: 175.w,
                                                            height: 233.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              image:
                                                                  DecorationImage(
                                                                image: FileImage(
                                                                    widget
                                                                        .datafour),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          )
                                                        : Container(
                                                            width: 175.w,
                                                            height: 233.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "${AppEndPoints.imageBaseURL}${myProducts[index].img}"),
                                                                // image: AssetImage(
                                                                //     "images/cat.jpg"),
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  widget.dataone != null
                                                      ? Text(
                                                          "Name :  ${myProducts[index].title}",
                                                          style: TextStyle(
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Text(
                                                          "Name :  ${trad[index]['name']}",
                                                          style: TextStyle(
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                  SizedBox(
                                                    height: 25.h,
                                                  ),
                                                  widget.datatwo != null
                                                      ? Text(
                                                          "price :  ${myProducts[index].price}  LE",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Text(
                                                          "price :  ${trad[index]['price']}  LE",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                  SizedBox(height: 25.h),
                                                  widget.datathree != null
                                                      ? Text(
                                                          "No.scales :  ${myProducts[index].stock}",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Text(
                                                          "No.scales :  ${trad[index]['number of scales']}",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 10.w,
                                    top: 8.h,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Edithome1(
                                                        tradd: trad[index],
                                                      )));
                                        },
                                        icon: Icon(
                                          Icons.settings,
                                          size: 30,
                                        )),
                                  )
                                ],
                              );
                            },
                          ),
                          fallback: (context)=>Center(child: CircularProgressIndicator(),),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        widget.Pimage != null
                            ? Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 250.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                widget.Pimage != null
                                                    ? Container(
                                                        width: 175.w,
                                                        height: 233.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          image:
                                                              DecorationImage(
                                                            image: FileImage(
                                                                widget.Pimage),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              widget.Pname != null
                                                  ? Text(
                                                      "Name :  ${widget.Pname}",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              widget.Pprice != null
                                                  ? Text(
                                                      "price :  ${widget.Pprice}  LE",
                                                      style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              widget.Pcount != null
                                                  ? Text(
                                                      "Number of scales :  ${widget.Pcount}",
                                                      style: TextStyle(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Container(),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  List<Recommendation> myProducts = [];
  getMyProducts() async {
    print('start get my products');
    await DioHelper.getData(
      url: AppEndPoints.getMyProducts,
      token: globalUser.token,
    ).then((value) {
      value.data['products'].forEach((e){
        myProducts.add(Recommendation.fromJson(e));
      });
      print(myProducts.length);
      setState(() {
        myProducts;
      });
    }).catchError((err) {
      showSnackBar(context: context, text: err.toString(), clr: Colors.red);
    });
    print('start get my products');
  }
}
