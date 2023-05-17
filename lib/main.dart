import 'package:fff/auth/signin.dart';
import 'package:fff/auth/splashscreen.dart';
import 'package:fff/helper/remote/dio_helper.dart';
import 'package:fff/pages/profile/edit_profile.dart';
import 'package:fff/pages/profile/profile.dart';
import 'package:fff/pages/shop/carts.dart';
import 'package:fff/pages/shop/pet.dart';
import 'package:fff/tast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_builder/timer_builder.dart';
// myToken =
// eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xLjUvYXBpL2xvZ2luIiwiaWF0IjoxNjgzNTk0NDA5LCJleHAiOjE2ODM1OTgwMDksIm5iZiI6MTY4MzU5NDQwOSwianRpIjoibEpCNUdMNmx5QzByWXRHbiIsInN1YiI6IjExIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.iZR5AtyJ4cTHT7YCWrgxaYVD5IhIh_YHtljeucYlF9E

// my Host
// http://192.168.1.5/

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
            //cart()
          SplashScreen(),



        //tast()
        );
      },
    );
  }
}





//
// class RecommendScreen extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
//       if (TimerBuilder.of(context).value.inSeconds % 20 == 0) {
//         return Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('أفضل منتج لدينا:'),
//               Image.asset('assets/product-image.jpg', width: 200, height: 200),
//               Text('وصف المنتج ومميزاته'),
//             ],
//           ),
//         );
//       } else {
//         return Container();
//       }
//     }),
//   );
// }
// }
