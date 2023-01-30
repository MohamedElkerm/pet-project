import 'dart:io';

import 'package:fff/components.dart';
import 'package:fff/pages/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class add_animal extends StatefulWidget {
  const add_animal({Key? key}) : super(key: key);

  @override
  State<add_animal> createState() => _add_animalState();
}

class _add_animalState extends State<add_animal> {
  var dateController = TextEditingController();
  TextEditingController date1 = TextEditingController();
  var imagepet;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Image(
          image: AssetImage("images/pro2.jpg"),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                  child: MaterialButton(
                onPressed: () async {
                  var pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      imagepet = File(pickedImage.path);
                    });
                  }
                },
                child: Container(
                  width: 320,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text(
                    "add pet photo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
                ),
              )),
              SizedBox(
                height: 12,
              ),
              defultForm(
                  hintText: "Pet Name",
                  background: Colors.redAccent,
                  color: Colors.white),
              SizedBox(
                height: 12,
              ),
              Text("Last time of vaccation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white)),
              SizedBox(
                height: 12,
              ),
              defultForm(
                  hintText: "enter date",
                  Controller: date1,
                  color: Colors.white,
                  ontap: () async {
                    DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101))
                        .then((value) {
                      date1.text = DateFormat().add_yMMMEd().format(value!);
                    });
                    // if(pickeddate != null){
                    //   setState(() {
                    //     date1.text =
                    //   });
                    // }
                  }),
              SizedBox(
                height: 60,
              ),
              Center(
                  child: Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => edit_profile(
                                  petimage: imagepet,
                                )));
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
