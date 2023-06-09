import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fff/components.dart';
import 'package:fff/helper/constants.dart';
import 'package:fff/helper/end_points.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/helper/snack_helper.dart';
import 'package:fff/pages/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class add_animal extends StatefulWidget {
  const add_animal({Key key}) : super(key: key);

  @override
  State<add_animal> createState() => _add_animalState();
}
/// TODO : handle images
class _add_animalState extends State<add_animal> {
  var dateController = TextEditingController();
  TextEditingController date1 = TextEditingController();
  TextEditingController petName1 = TextEditingController();
  var imagetwo;
  var file;
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
        Positioned(
            top: 170,
            right: 120,
            child: Center(
              child: Text(
                "Add Pet Photo",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
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
                      .pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(()async {

                      imagetwo = File(pickedImage.path);

                      // var path = baseName(value.path);
                      file = await MultipartFile.fromFile(imagetwo.path);

                    });
                  }
                },
                child: Container(
                  width: 340,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(25)),
                ),
              )),
              SizedBox(
                height: 17,
              ),
              defultForm(
                  Controller: petName1,
                  hintText: "Pet Name",
                  background: Colors.redAccent,
                  color: Colors.white),
              SizedBox(
                height: 12,
              ),
              Text("Recommend time of vaccation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.white)),
              SizedBox(
                height: 12,
              ),
              defultForm(
                  keyboard: TextInputType.number,
                  Controller: date1,
                  hintText: "Recommend of vaccation ",
                  background: Colors.redAccent,
                  color: Colors.white),
              SizedBox(
                height: 20,
              ),
              // defultForm(
              //     hintText: "enter date",
              //     Controller: date1,
              //     color: Colors.white,
              //     ontap: () async {
              //       DateTime? pickeddate = await showDatePicker(
              //               context: context,
              //               initialDate: DateTime.now(),
              //               firstDate: DateTime(2000),
              //               lastDate: DateTime(2101))
              //           .then((value) {
              //         date1.text = DateFormat().add_d().format(value!);
              //       });
              //     }),SizedBox(height: 70,),
              Container(
                width: 170,
                decoration: BoxDecoration(
                    color: Color(0xff269A41),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: MaterialButton(
                  onPressed: () {
                    print(date1.text);
                    print(imagetwo);
                    print(file);
                    //TODO : add user pet
                    addAnimals(
                      name: petName1.text,
                      img: imagetwo,
                      vaccines: date1.text,
                    );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  addAnimals({
    @required name,
    @required File img,
    @required vaccines,
  }) async {
    print('start add animals');
    // print(file.path);
    print('dasdasdasd');
    print(img);

    FormData formData = FormData.fromMap({
      "user_id": globalUser.user.id,
      "name": name,
      "img": await MultipartFile.fromFile(imagetwo.path),
      "vaccines": '2024-01-01',
    });

    await DioHelper.postImage(
      url: AppEndPoints.addUserAnimal,
      token: globalUser.token,
      data: formData,
    ).then((value) {
      showSnackBar(
        context: context,
        text: value.data['message'],
        clr: Colors.green,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => edit_profile(
                    petimage: imagetwo,
                    petName: petName1.text,
                    time: date1,
                  )));
    }).catchError((err) {
      showSnackBar(
        context: context,
        text: err.toString(),
        clr: Colors.red,
      );
      print(err.toString());
    });
  }
}
