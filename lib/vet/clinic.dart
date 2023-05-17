import 'package:fff/helper/constants.dart';
import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/helper/snack_helper.dart';
import 'package:fff/models/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class clinic extends StatefulWidget {
  const clinic({Key key}) : super(key: key);

  @override
  State<clinic> createState() => _clinicState();
}

class _clinicState extends State<clinic> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVetBooking();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          height: double.infinity,
          color: Color(0xffD4D2D2),
        ),
        ListView.builder(
            itemCount: myBooking.length,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.all(12),
                height: 190.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 15.w, bottom: 10.h),
                              child: Text(
                                "${myBooking[i].userId}",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.h, left: 15.w, bottom: 10.h),
                              child: Text(
                                "${myBooking[i].petName}",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 35.h, left: 10.w, bottom: 10.h),
                              child: Text(
                                "Day: ${myBooking[i].date}",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.blueGrey,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 12.h, left: 12.w, bottom: 8.h),
                              child: Text(
                                "Hour: ${myBooking[i].time}",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.blueGrey,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if(myBooking[i].status != 'approved')
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              color: Color(0xff28A745),
                              border: Border.all()),
                          width: 155.w,
                          height: 43.h,
                          margin: EdgeInsets.only(
                            top: 22.h,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              approveBooking(myBooking[i].id.toInt());
                            },
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: Color(0xffA20808),
                          ),
                          width: 155.w,
                          height: 43.h,
                          margin: EdgeInsets.only(
                            top: 22.h,
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                "Another Time",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ],
    ));
  }

  List<BookingElement> myBooking = [];
  getVetBooking() async {
    print('start get vet booking');
    await DioHelper.getData(
      url: AppEndPoints.vetBooking,
      token: globalUser.token,
    ).then((value) {
      value.data['booking'].forEach((e) {
        // TODO : to appears approved booking
        // if(e['status'] != 'approved')
          myBooking.add(BookingElement.fromJson(e));
      });
      print('get Booking Success');
      setState(() {
        myBooking;
      });
    }).catchError((err) {
      print('start get vet booking');
      print(err.toString());
    });
  }

  approveBooking(id) async {
    print('start approve booking');
    await DioHelper.putData(
      url: AppEndPoints.approveBooking,
      data: {
        "id" :id ,
      },
      token: globalUser.token,
    ).then((value) {
      print('approved booking');
      showSnackBar(context: context, text: 'success', clr: Colors.green,);
      showSnackBar(context: context, text: 'success', clr: Colors.green,);
      print('approved');

    }).catchError((err) {
      showSnackBar(context: context, text: 'error ${err.toString()}', clr: Colors.green,);
      print(err.toString());

    });
  }
}

/*
List addd = [
    {
      "nam": "Mohamed ali",
      "dog": "Mavi",
      "num": "0123456789",
      "day": "22/4/2023",
      "hour": "8:30 PM"
    },
    {
      "nam": "Ahmed ali",
      "dog": "Rex",
      "num": "0123456789",
      "day": "22/4/2023",
      "hour": "8:30 PM"
    },
    {
      "nam": "Mohamed ali",
      "dog": "Mavi",
      "num": "0123456789",
      "day": "22/4/2023",
      "hour": "8:30 PM"
    },
    {
      "nam": "hossam ali",
      "dog": "Rex",
      "num": "0123456789",
      "day": "22/4/2023",
      "hour": "8:30 PM"
    },
    {
      "nam": "Mohamed Ahmed",
      "dog": "Mavi",
      "num": "0123456789",
      "day": "22/4/2023",
      "hour": "8:30 PM"
    },
  ];
 */
