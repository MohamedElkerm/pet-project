import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class service extends StatefulWidget {
  const service({Key? key}) : super(key: key);

  @override
  State<service> createState() => _serviceState();
}

class _serviceState extends State<service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
        body: Stack(children: [
          Image(image: AssetImage("images/About.png"),fit: BoxFit.cover,width: double.infinity,),
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(width: 350,height: double.infinity,color: Colors.white70,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 10,),
                Text("Pet Life",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("  It is App that provides all what you need,we provide a shop which you can pets,food,accessories,and treatment.",style: TextStyle(color: Colors.black54,fontSize: 25,fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("  We also provide a category which you can know types of pets to choose best pet for you.",style: TextStyle(color: Colors.black54,fontSize: 25,fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("  You can communicate with doctor to book appointment to treat your pet,and you have a profile to add and modify your info and your pets.",style: TextStyle(color: Colors.black54,fontSize: 25,fontWeight: FontWeight.w600),),
                ),
                Text("Team Project",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                Container(
                  height: 500,
                  width: double.infinity,
                  child: Carousel(
                    boxFit:BoxFit.fill,
                    images: [
                      AssetImage("images/11.JPG"),
                      AssetImage("images/12.JPG"),
                      // AssetImage("images/fish.jpg"),
                      // AssetImage("images/dog1.jpg"),
                      // AssetImage("images/bird.jpg"),
                    ],
                    dotSize: 0,
                    dotIncreaseSize: 0,
                    dotBgColor: Colors.white12,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(color: Colors.black87,
                    //borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))
                  ),
                  height: 260,width: 390,
                  child: Padding(
                    padding: const EdgeInsets.only(top:25,left: 13),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pet Life",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                            Container(color: Colors.green,width: 40,height: 3,),
                            SizedBox(height: 11,),
                            Text("A App for people who ",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 2,),
                            Text("interested in pets,you ",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 2,),
                            Text(" can find all what you ",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 2,),
                            Text("need(pets,food,acce..",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 2,),
                            Text("ssories,and medicine)",style: TextStyle(color: Colors.white),),
                          ],),
                        Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Have a Question?",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                            Container(color: Colors.green,width: 40,height: 3,),
                            SizedBox(height: 6,),
                            Container(width: 199,
                              child: ListTile(
                                leading: Icon(Icons.place_outlined,color: Colors.white,size: 30,),
                                title:Text("203 Fake St.mansouer,",style: TextStyle(color: Colors.white),),
                                subtitle: Text("El-Dakahila,Egypt",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Container(width: 199,
                              child: ListTile(
                                leading: Icon(Icons.phone,color: Colors.white,size: 30,),
                                title:Text("+20 1234567890",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Container(width: 199,
                              child: ListTile(
                                leading: Icon(Icons.telegram,color: Colors.white,size: 30,),
                                title:Text("info@yourdomain.com",style: TextStyle(color: Colors.white),),
                              ),
                            ),

                            // SizedBox(height: 2,),
                            // Text(" can find all what you ",style: TextStyle(color: Colors.white),),
                            // SizedBox(height: 2,),
                            // Text("need(pets,food,acce..",style: TextStyle(color: Colors.white),),
                            // SizedBox(height: 2,),
                            // Text("ssories,and medicine)",style: TextStyle(color: Colors.white),),
                          ],),
                      ],),
                  ),)


              ],),
            ),),
          ))

        ],),);
  }
}
