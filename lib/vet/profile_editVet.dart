import 'dart:io';

import 'package:fff/vet/profile_vet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components.dart';

class profile_editVet extends StatefulWidget {
  profile_editVet({Key? key, this.nameed, this.phoneed, this.addressed})
      : super(key: key);
  var nameed;
  var phoneed;
  var addressed;

  @override
  State<profile_editVet> createState() => _profile_editVetState();
}

class _profile_editVetState extends State<profile_editVet> {
  var image;
  var nameController;
  var addressController;
  var phoneController;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.grey[400],
            height:double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(
                                child: Stack(
                                  children: [
                                    image == null
                                        ?
                                    Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              AssetImage("images/55.jpg"),
                                              fit: BoxFit.fill),

                                        ),
                                        width: double.infinity,
                                        height: 390)
                                        :Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                              FileImage(image),
                                              fit: BoxFit.fill),

                                        ),
                                        width: double.infinity,
                                        height: 390),
                                    Positioned(
                                      right: 3,
                                        top: 340,

                                        child: IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 200,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "Choose photo from",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  fontWeight:
                                                                  FontWeight.bold),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          MaterialButton(
                                                            onPressed: () async {
                                                              var pickedImage =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                  source:
                                                                  ImageSource
                                                                      .camera);
                                                              if (pickedImage != null) {
                                                                setState(() {
                                                                  image = File(
                                                                      pickedImage.path);
                                                                });
                                                                Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons.camera),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Text(
                                                                  " camera",
                                                                  style: TextStyle(
                                                                      fontSize: 25,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          MaterialButton(
                                                            onPressed: () async {
                                                              var pickedImage =
                                                              await ImagePicker()
                                                                  .pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                              if (pickedImage != null) {
                                                                setState(() {
                                                                  image = File(
                                                                      pickedImage.path);
                                                                });

                                                                Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .photo_outlined),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Text(
                                                                  " gallery",
                                                                  style: TextStyle(
                                                                      fontSize: 25,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            icon: Icon(
                                              shadows: [Shadow(
                                                  blurRadius: 15,
                                                  color: Colors.blueGrey)],
                                              Icons.camera_alt,
                                              size: 43,
                                              color: Colors.black,
                                            ))),
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
                                            color: Colors.black,
                                            size: 30,
                                          )),
                                    ),
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () {
                                              var formdata = formKey.currentState;
                                              if (formdata!.validate()) {
                                                formdata.save();
                                                print("valid");
                                              } else {
                                                print("not valid");
                                              }
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (c) => profile_vet(
                                                    name: nameController,
                                                    phone: phoneController,
                                                    address: addressController,
                                                    images: image,
                                                  )));
                                            },
                                            icon: Icon(
                                              Icons.task_alt_outlined,
                                              size: 40,
                                            ))),


                                  ],
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Container(

                              alignment: Alignment.topLeft,
                              child: Text(
                                "   Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(left: 30),
                                    height: 50,
                                    width: 240,
                                    child: defultForm(color: Colors.white,
                                        initialvalue: widget.nameed,
                                        onsaved: (val) {
                                          nameController = val;
                                        },
                                        validator: (value) => value!.isEmpty
                                            ? "enter a valid Name"
                                            : null)),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      " Phone",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 240,
                                          height: 50,
                                          margin: EdgeInsets.only(left: 20),
                                          alignment: Alignment.topLeft,
                                          child: defultForm(
                                            color: Colors.white,
                                            initialvalue: widget.phoneed,
                                            onsaved: (val) {
                                              phoneController = val;
                                            },
                                            validator: (value) => value!.isEmpty
                                                ? "enter a valid Phone"
                                                : null,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      " Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 240,
                                          height: 50,
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.only(left: 20),
                                          child: defultForm(
                                            color: Colors.white,
                                            initialvalue: widget.addressed,
                                            onsaved: (val) {
                                              addressController = val;
                                            },

                                            validator: (value) => value!.isEmpty
                                                ? "enter a valid Address"
                                                : null,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}