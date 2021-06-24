import 'package:design_tutorial/routes.dart';
import 'package:design_tutorial/screens/app_2/dynamic_form/dynamic_form.dart';
import 'package:design_tutorial/screens/app_2/splash/splash_screen.dart';
import 'package:design_tutorial/screens/app_3/basic_form.dart';
import 'package:design_tutorial/theme.dart';
// import 'package:design_tutorial/screens/app_1/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: BasicForm.routeName, // SplashScreen.routeName,
      routes: routes,
    );
  }
}

// For App_1
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
