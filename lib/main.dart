import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/ui/pages/HomePageUi.dart';
import 'package:taskapp/ui/pages/MainAppProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainAppProvider()),

    ],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
       theme: ThemeData(textTheme: TextTheme(headline1: TextStyle(
       fontSize: 16.0,color: Colors.grey.withOpacity(0.5))),
           fontFamily:'DinNextRegular',
       primaryColor:Color(0xffff5f5f5),
        accentColor: Color(0xff3a8c36),
        primarySwatch: Colors.blue,
     scaffoldBackgroundColor:Color(0xfff5f5f5)
      ),
      home: HomePageUi(),
    );
  }
}

