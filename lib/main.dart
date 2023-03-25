import 'package:doctor_app/Resources/R.dart';
import 'package:doctor_app/Routes/PageRoutes.dart';
import 'package:doctor_app/Routes/RoutesPath.dart';
import 'package:doctor_app/ViewModel/UserUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserUtils()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor App',
      theme: ThemeData(primaryColor: R.colors.themeColor),
      onGenerateRoute: PageRoutes.generateRoutes,
      initialRoute: PagePath.SIGNIN_PAGE,
    );
  }
}
