
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';
import 'package:goodtime/screens/ayarlar.dart';
import 'package:goodtime/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class ilgiAlani extends StatefulWidget {
  @override
  _ilgiAlaniState createState() => _ilgiAlaniState();
}

class _ilgiAlaniState extends State<ilgiAlani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarkPrimary,
      appBar: AppBar(
        title: Text("İlgi Alanları"),
        backgroundColor:colorDarkPrimary ,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Column(
            children: [
              Container(alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Secildi=="Dans"?Colors.limeAccent:Colors.white),
              ),
              child:TextButton(onPressed: (){
                Secildi="Dans";
                SecilenAlanEtkinlik=Etkinlikdans.length;

                setState(() {

                });
              },child: Text("Dans",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Dans"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Secildi=="Edebiyat"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Edebiyat";
                  SecilenAlanEtkinlik=EtkinlikEdebiyat.length;

                  setState(() {

                  });
                },child: Text("Edebiyat",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Edebiyat"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color:Secildi=="Fotoğrafçılık"?Colors.limeAccent: Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Fotoğrafçılık";
                  SecilenAlanEtkinlik=EtkinlikFotografcilik.length;

                  setState(() {

                  });
                },child: Text("Fotoğrafçılık",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Fotoğrafçılık"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color:  Secildi=="Müzik"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Müzik";
                  SecilenAlanEtkinlik=EtkinlikMuzik.length;

                  setState(() {

                  });
                },child: Text("Müzik",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Müzik"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color:  Secildi=="Masa Oyunları"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Masa Oyunları";
                  SecilenAlanEtkinlik=EtkinlikMasaOyun.length;

                  setState(() {

                  });
                },child: Text("Masa Oyunları",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Masa Oyunları"?Colors.limeAccent: Colors.white),)),), Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color:Secildi=="Tarih"?Colors.limeAccent:  Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Tarih";
                  SecilenAlanEtkinlik=EtkinlikTarih.length;

                  setState(() {

                  });
                },child: Text("Tarih",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Tarih"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Secildi=="Tasarım"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Tasarım";
                  SecilenAlanEtkinlik=EtkinlikTasarim.length;

                  setState(() {

                  });
                },child: Text("Tasarım",style: GoogleFonts.adventPro(fontSize: 20,color:  Secildi=="Tasarım"?Colors.limeAccent:Colors.white),)),),
                 Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color:  Secildi=="Teknoloji"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Teknoloji";
                  SecilenAlanEtkinlik=EtkinlikTeknoloji.length;

                  setState(() {

                  });
                },child: Text("Teknoloji",style: GoogleFonts.adventPro(fontSize: 20,color:  Secildi=="Teknoloji"?Colors.limeAccent:Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Secildi=="Spor"?Colors.limeAccent: Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Spor";
                  SecilenAlanEtkinlik=EtkinlikSpor.length;

                  setState(() {

                  });
                },child: Text("Spor",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Spor"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color:  Secildi=="Resim"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Resim";
                  SecilenAlanEtkinlik=EtkinlikResim.length;

                  setState(() {

                  });
                },child: Text("Resim",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Resim"?Colors.limeAccent: Colors.white),)),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Secildi=="Yemek Yapmak"?Colors.limeAccent:Colors.white),
                ),
                child:TextButton(onPressed: (){
                  setState(() {
                    Secildi="Yemek Yapmak";
                    SecilenAlanEtkinlik=EtkinlikYemek.length;

                  });
                },child: Text("Yemek",style: GoogleFonts.adventPro(fontSize:20,color:Secildi=="Yemek Yapmak"?Colors.limeAccent:Colors.white),),),),
              Container(alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Secildi=="Yoga"?Colors.limeAccent: Colors.white),
                ),
                child:TextButton(onPressed: (){
                  Secildi="Yoga";
                  SecilenAlanEtkinlik=EtkinlikYoga.length;
                  setState(() {

                  });
                },child: Text("Yoga",style: GoogleFonts.adventPro(fontSize: 20,color:  Secildi=="Yoga"?Colors.limeAccent:Colors.white),)),),
            ],
          ),
          SizedBox(height: 30,),
          Container(alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2,color: Colors.white),
              ),
              child: TextButton(onPressed: (){
                SecilenAlan=Secildi;
                setState(() {
                  ToplamAlanUzunluklari;
                });
                tut();
                Future.delayed(Duration(seconds: 1),(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                });
              },child: Text("  Kaydet  ",style: GoogleFonts.adventPro(fontSize: 20,color: Colors.white),)),
            ),),
        ],
      ),
    );
  }
}
