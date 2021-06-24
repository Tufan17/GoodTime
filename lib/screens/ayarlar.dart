import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';
import 'package:goodtime/screens/ilgialan.dart';
import 'package:goodtime/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Ayarlar extends StatefulWidget {
  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarkPrimary,
      appBar: AppBar(
        title: Text("Ayarlar"),
        backgroundColor:colorDarkPrimary ,
        centerTitle: true,
      ),
      body: ListView(
        children: [

          Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: TextButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

              }, child: Text("Giriş Yap",style: GoogleFonts.play(color: Colors.white),))),
          Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: TextButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ilgiAlani()));

              }, child: Text("İlgi Alanları",style: GoogleFonts.play(color: Colors.white),))),

        ],
      ),

    );
  }
}
