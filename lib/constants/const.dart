
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Colors
const kPrimaryColor = Color(0xFFFF97B3);
const kSecondaryLightColor = Color(0xFFE4E9F2);
const kSecondaryDarkColor = Color(0xFF404040);
const kAccentLightColor = Color(0xFFB3BFD7);
const kAccentDarkColor = Color(0xFF4E4E4E);
const kBackgroundDarkColor = Color(0xFF3A3A3A);
const kSurfaceDarkColor = Color(0xFF222225);
// Icon Colors
const kAccentIconLightColor = Color(0xFFECEFF5);
const kAccentIconDarkColor = Color(0xFF303030);
const kPrimaryIconLightColor = Color(0xFFECEFF5);
const kPrimaryIconDarkColor = Color(0xFF232323);
// Text Colors
const kBodyTextColorLight = Color(0xFFA1B0CA);
const kBodyTextColorDark = Color(0xFF7C7C7C);
const kTitleTextLightColor = Color(0xFF101112);
const kTitleTextDarkColor = Colors.white;

const kShadowColor = Color(0xFF364564);
const Color colorLightPrimary = Color(0xFF5C93C4);
const Color colorLightSecondary = Color(0xFFF9F6E5);
const Color colorLightCardColors = Color(0xFFFFFFFF);
// #Light Color

// Light Color
const Color colorDarkPrimary = Color(0xFF222831);
const Color colorDarkSecondary = Color(0xFF30475E);
const Color colorDarkThird = Color(0xFFF2A365);
const Color colorDarkTitle = Color(0xFFECECEC);
// #Light Color

// Get Started
const Color colorStarted = Color(0xFF274C71);
const Color colorStartedTitle = Color(0xFF352641);
const Color colorStartedDescription = Color(0xFF767676);
const Color colorStartedShadow = Color(0x60274C71);

String UserName="Kullanıcı Adı";
String Sifre="";
String Isim="";
String Soyisim="";
String Secildi="";
String SecilenAlan="";

String Gun;
int EtkinlikYapildi=0;

List ilgiAlanlari=[
 "Spor"
 , "Müzik"
  ,"Edebiyat"
  ,"Tarih"
  ,"Resim"
  ,"Tasarım"
  ,"Fotoğrafçılık"
  ,"Masa Oyunları"
  ,"Dans"
,"Yemek Yapma"
,  "Yoga"
];

List BenimEtkinligim=[];
List <String>BenimEtkinligim1=[];
 bool benimEtkinligim1=false;
List Etkinlikdans=[
 "Bale Yapmaya nedersin."
 ];
List EtkinlikEdebiyat=[
 "Şiir okumaya nedersin",
 "Şiir yazmaya nedersin",
 "Roman okumaya nedersin",
 "Masal okumaya nedersin",
 ];
List EtkinlikFotografcilik=[
 "Harika bir manzara fotoğrafı çekmeye nedersin"
 ];
List EtkinlikMuzik=[
 "Enstrüman calmaya nedersin",
 "müzik dinlemeye nedersin",
 ];
List EtkinlikMasaOyun=[
 "Masatenisi oynamaya nedersin",
 "satranç oynamaya nedersin",
 ];
List EtkinlikTarih=[
 "Osmanlı tarihini öğrenmeye nedersin",
 "I.Dünya savaşını öğrenmeye nedersin",
 "II.Dünya savaşını öğrenmeye nedersin",

];
List EtkinlikTasarim=[
 "Birşeyler Tasarlayıp çizmeye nederesin"
 ];
List EtkinlikTeknoloji=[
 "Bilim kurgu film veya belgesel okumaya nedersin",
 "Teknolojik bir araştırma yapmaya nedersin ",
 "Yazılım dili Öğrenmeye nedersin",
 "Bilim ile ilgili kitap okumaya nedersin",
];
List EtkinlikSpor=[
 "Kitap okumaya nedersin.",
 "Atletizm yapmaya nedersin.",
 "Atıcılık yapmaya nedersin.",
 "Aikido yapmaya nedersin.",
 "Amerikan Güreşi yapmaya nedersin.",
 "Amerikan Futbolu oynamaya nedersin." ,
 "Ayak Voleybolu oynamaya nedersin." ,
 "Basketbol oynamaya nedersin." ,
 "Badminton yapmaya nedersin." ,
 "Buz Pateni yapmaya nedersin." ,
 "Beyzbol oynamaya nedersin." ,
 "Bilardo oynamaya nedersin.",
 "Bisiklet sürmeye nedersin.",
 "Binicilik yapmaya nedersin.",
 "Boks yapmaya nedersin.",
 "Bowling oynamaya nedersin.",
 "Bungee Jumping yapmaya nedersin.",
 "Buz Hokeyi yapmaya nedersin.",
 "Bocce – Petank yapmaya nedersin.",
 "Curling yapmaya nedersin.",
 "Dağcılık yapmaya nedersin.",
 "Dalgıçlık yapmaya nedersin.",
 "Dart oynamaya nedersin.",
 "Eskrim yapmaya nedersin.",
 "Fitness yapmaya nedersin.",
 "Futbol oynamaya nedersin.",
 "Golf oynamaya nedersin.",
 "Güreş yapmaya nedersin.",
 "Hentbol oynamaya nedersin.",
 "Jimnastik yapmaya nedersin.",
 "Judo yapmaya nedersin.",
 "Kayak yapmaya nedersin.",
 "Kaykay yapmaya nedersin.",
 "Kick Boks yapmaya nedersin.",
 "Koşu yapmaya nedersin.",
 "Kriket oynamaya nedersin.",
 "Kürek yapmaya nedersin.",
 "Lakros yapmaya nedersin.",
 "Maraton koşmaya nedersin." ,
 "Masa Tenisi oynamaya nedersin.",
 "Motor Sporları yapmaya nedersin.",
 "Okçuluk yapmaya nedersin.",
 "Oryantiring yapmaya nedersin.",
 "Paddle Boarding yapmaya nedersin.",
 "Paintball oynamaya nedersin.",
 "Paraşüt yapmaya nedersin.",
 "Parkour yapmaya nedersin.",
 "Paten kaynak nedersin.",
 "Pilates yapmaya nedersin.",
 "Rugby yapmaya nedersin.",
 "Rafting yapmaya nedersin.",
 "Snowboard yapmaya nedersin.",
 "Sokak Kızağı yapmaya nedersin.",
 "Step – Aerobik yapmaya nedersin.",
 "Sörf yapmaya nedersin.",
 "Su Topu oynamaya nedersin.",
 "Taekwondo yapmaya nedersin.",
 "Tenis oynamaya nedersin.",
 "Triatlon yapmaya nedersin.",
 "Su Kayağı yapmaya nedersin.",
 "Voleybol oynamaya nedersin.",
 "Wushu yapmaya nedersin.",
 "Yağlı Güreş yapmaya nedersin.",
 "Yelken yapmaya nedersin.",
 "Yüzmeye nedersin.",
 "Halter yapmaya nedersin.",
 ];
List EtkinlikResim=[
 "Manzara resimi yapmaya nedersin",
 "insan resimi yapmaya nedersin",
 "hayvan resimi yapmaya nedersin",
 "Uzay resimi yapmaya nedersin",
 ];
List EtkinlikYemek=[
 "Güzel bir yemek hazırlamaya nedersin",
];
List EtkinlikYoga=[
 "Biraz Yoga yapıp gevşemeye nedersin",
 ];

int ToplamAlanUzunluklari=(Etkinlikdans.length+EtkinlikEdebiyat.length+EtkinlikFotografcilik.length+EtkinlikMuzik.length+EtkinlikMasaOyun.length+EtkinlikResim.length+EtkinlikSpor.length+EtkinlikTarih.length+EtkinlikTasarim.length+EtkinlikTeknoloji.length+EtkinlikYemek.length+EtkinlikYoga.length);
int SecilenAlanEtkinlik;


File SeciliDosya;

String SeciliDosyaYolu="";

SharedPreferences mySharedPreferences;

hafiza(){
 SharedPreferences.getInstance().then((sf) => {
  mySharedPreferences = sf,
  met(),
 });
}

met() async{
 UserName=await (mySharedPreferences as SharedPreferences).getString("username")??"";
 Isim=await (mySharedPreferences as SharedPreferences).getString("name")??"";
 Soyisim=await (mySharedPreferences as SharedPreferences).getString("surname")??"";
 Sifre=await (mySharedPreferences as SharedPreferences).getString("password")??"";
 SeciliDosyaYolu=await (mySharedPreferences as SharedPreferences).getString("SeciliDosyaYolu")??"";
 SecilenAlan=await (mySharedPreferences as SharedPreferences).getString("SecilenAlan")??"";
 SecilenAlanEtkinlik=await (mySharedPreferences as SharedPreferences).getInt("SecilenAlanEtkinlik")??"";
 EtkinlikYapildi=await (mySharedPreferences as SharedPreferences).getInt("EtkinlikYapildi")??"";
 BenimEtkinligim1=await (mySharedPreferences as SharedPreferences).getStringList("BenimEtkinligim");

 print(Sifre+","+UserName);
 print(SecilenAlan);
}
tut()async{
 await(mySharedPreferences as SharedPreferences).setString("username", UserName);
 await(mySharedPreferences as SharedPreferences).setString("name", Isim);
 await(mySharedPreferences as SharedPreferences).setString("surname", Soyisim);
 await(mySharedPreferences as SharedPreferences).setString("password", Sifre);
 await(mySharedPreferences as SharedPreferences).setString("SecilenAlan", SecilenAlan);
 await(mySharedPreferences as SharedPreferences).setString("SeciliDosyaYolu", SeciliDosyaYolu);
 await(mySharedPreferences as SharedPreferences).setInt("SecilenAlanEtkinlik", SecilenAlanEtkinlik);
 await(mySharedPreferences as SharedPreferences).setInt("EtkinlikYapildi", EtkinlikYapildi);
 await(mySharedPreferences as SharedPreferences).setStringList("BenimEtkinligim", BenimEtkinligim1);
}
