import 'package:fff/helper/constants.dart';
import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/models/vets.dart';
import 'package:fff/pages/doctorpage/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctorone.dart';

class doctors extends StatefulWidget {
  const doctors({Key key}) : super(key: key);

  @override
  State<doctors> createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {
  @override
  void initState() {
    // TODO: implement initState
    getVets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          color: Color(0xffD4D2D2),
          child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [

                  Container(
                    height: 230.h,
                    // height: MediaQuery.of(context).size.height*0.75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        image: DecorationImage(
                          image: AssetImage("images/66.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => Notifi()));
                  //     },
                  //     icon: Icon(
                  //       Icons.notifications,
                  //       size: 55,
                  //       color: Color(0xff269A41),
                  //     ))
                ],
              ),
              SizedBox(
                height: 0,
              ),
              // Text(
              //   " Choose the doctor ",
              //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              // ),
              // Text(
              //   " who you like",
              //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(height: 10,),
              // Center(child: Container(width:200,height: 3,color: Colors.orangeAccent,)),
              SizedBox(
                height: 25,
              ),
              IconButton(onPressed: (){
                setState(() {
                  myVets;
                });
              }, icon: Icon(Icons.refresh)),

              ///TODO : top rating doctors
              // Text(
              //   " Top Rating of doctors",
              //   style: TextStyle(
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.redAccent),
              // ),
              // Container(
              //   height: 250,
              //   child: ListView.builder(
              //     itemBuilder: (context, index) => Container(
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           border: Border.all(width: 1.8),
              //           borderRadius: BorderRadius.all(Radius.circular(25))),
              //       margin: EdgeInsets.all(10),
              //       width: 200,
              //       child: MaterialButton(
              //         padding: EdgeInsets.zero,
              //         onPressed: () {
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => One()));
              //         },
              //         child: Column(
              //           children: [
              //             Stack(
              //               children: [
              //                 Container(
              //                   height: 190,
              //                   width: double.infinity,
              //                   decoration: BoxDecoration(
              //                       border: Border.all(width: 0.5),
              //                       borderRadius: BorderRadius.only(
              //                           topLeft: Radius.circular(24),
              //                           topRight: Radius.circular(24)),
              //                       image: DecorationImage(
              //                           image: AssetImage("images/doc1.jpg"),
              //                           fit: BoxFit.cover)),
              //                 ),
              //                 Container(
              //                   padding: EdgeInsets.only(top: 7),
              //                   decoration: BoxDecoration(
              //                       color: Colors.redAccent,
              //                       borderRadius: BorderRadius.only(
              //                           topLeft: Radius.circular(24),
              //                           bottomRight: Radius.circular(20))),
              //                   height: 35,
              //                   width: 65,
              //                 ),
              //                 Row(
              //                   children: [
              //                     Icon(
              //                       Icons.star,
              //                       color: Colors.yellow,
              //                       size: 29,
              //                     ),
              //                     Text(
              //                       "4.9",
              //                       style: TextStyle(
              //                           fontSize: 20,
              //                           fontWeight: FontWeight.bold),
              //                     )
              //                   ],
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               "Dr.vet",
              //               style: TextStyle(
              //                   fontSize: 20, fontWeight: FontWeight.bold),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     itemCount: 6,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //   ),
              // ),

              SizedBox(
                height: 11,
              ),
              Text(
                " Choose the doctor ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                " who you like",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 300,
                    maxCrossAxisExtent: 222,
                    childAspectRatio: 1.5 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.8),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  margin: EdgeInsets.all(10),
                  width: 222.w,
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        globalVet = myVets[index];
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => One()));
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 190.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24)),
                                image:myVets[index].img==null? DecorationImage(
                                  image: AssetImage("images/doc1.jpg"),
                                  fit: BoxFit.cover,
                                ):Image.network(
                                  "${AppEndPoints.imageBaseURL}${myVets[index].img}",
                                  height: 215,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 7),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      bottomRight: Radius.circular(20))),
                              height: 35,
                              width: 65,
                            ),
                            // TODO : not found the
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 29,
                                ),
                                Text(
                                  "2.3",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Center(
                          child: Text(
                            '${myVets[index].firstname} ${myVets[index].lastname}',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: myVets.length,
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          )),
    );
  }

  List<Vet> myVets = [];

  getVets() async {
    print('start get Vets');
    await DioHelper.getData(url: AppEndPoints.getVets).then((value) {
      value.data['vets'].forEach((e) {
        myVets.add(Vet.fromJson(e));
      });
      print(myVets.length);
      setState(() {
        myVets;
      });
    }).catchError((err) {
      print('get Vets Error');
      print(err.toString());
    });
  }
}
