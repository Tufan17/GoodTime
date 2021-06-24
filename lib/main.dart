import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';
import 'package:goodtime/screens/homepage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await hafiza();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
}
}
