import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FishData extends StatefulWidget {
  const FishData({Key? key, this.datafish}) : super(key: key);

  final datafish;

  @override
  State<FishData> createState() => _FishDataState();
}

class _FishDataState extends State<FishData> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          width: double.infinity,
          height: double.infinity,
          color:Color(0xffD4D2D2),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 510.h,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                image: DecorationImage(
                                    image: AssetImage(widget.datafish['image']),fit: BoxFit.fill)),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                border: Border.all(width: 1.5),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.all(10),
                            child: IconButton(
                                padding: EdgeInsets.only(right: 1.5, bottom: 1.5),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "  ${widget.datafish['type']}",
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${widget.datafish['sub']}",
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
