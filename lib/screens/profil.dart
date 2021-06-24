import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'ayarlar.dart';

class PRofil extends StatefulWidget {
  @override
  _PRofilState createState() => _PRofilState();
}

class _PRofilState extends State<PRofil> {
  int i=0;
  bool uyar=false;
  PageController gec=PageController(initialPage: 0);
  Color a;
  @override

  void initState() {
    // TODO: implement initState
    setState(() {
      SeciliDosyaYolu==""?print("resim yok"):SeciliDosya=File(SeciliDosyaYolu);
      setState(() {
        Secildi=SecilenAlan;
        ToplamAlanUzunluklari;
        EtkinlikYapildi;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(flex:3,
            child: Stack(
              children: [
                SafeArea(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>Ayarlar()));
                    },icon: Icon(Icons.settings,color: Colors.white,size: 30,)),),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: colorDarkPrimary,
                        maxRadius: 75,
                        backgroundImage:SeciliDosya==null?AssetImage("assets/image/goodtime.png"):FileImage(SeciliDosya),
                      ),
                      Positioned(bottom: -15,right: -5,child: IconButton(
                          onPressed: (){
                            SecimDosya(context);
                          },
                          icon: Icon(Icons.add,size: 30,color: Colors.white,))),

                    ],
                  ),
                ),
                Center(child: Padding(
                  padding: const EdgeInsets.only(top:200),
                  child: Text(UserName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                )),
              ],
            )),
        Expanded(flex:1,
          child: Container(
            //   color: CupertinoColors.white,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                      children: [
                        Column(
                          children: [
                            Container(color: colorDarkSecondary,alignment:Alignment.center,
                              height: 30,
                              child: Text("Tolam Etkinlikler",style: TextStyle(color: Colors.white),),),
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(ToplamAlanUzunluklari.toString(),style: TextStyle(color: Colors.white),),),
                          ],
                        ),

                        Column(
                          children: [
                            Container(color: colorDarkSecondary,alignment:Alignment.center,
                              height: 30,
                              child: Text("Alan Etkinlikleri",style: TextStyle(color: Colors.white),),),
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(SecilenAlanEtkinlik==null?"0":SecilenAlanEtkinlik.toString(),style: TextStyle(color: Colors.white),),),
                          ],
                        ),

                        Column(
                          children: [
                            Container(color: colorDarkSecondary,alignment:Alignment.center,
                              height: 30,
                              child: Text("Seçilen Alan",style: TextStyle(color: Colors.white),),),
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(SecilenAlan==""?"Alan seçilmedi":SecilenAlan,style: TextStyle(color: Colors.white),),),
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),),
        Expanded(flex:4,
          child: Container(
            padding: EdgeInsets.all(8),
            //  color: Colors.yellow,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Container(
                              color:colorDarkSecondary,
                              alignment: Alignment.center,
                              height: 25,
                              child: Text("Yeni Etkinlikler",style: TextStyle(color: Colors.white),),
                            ),
                            Container(alignment: Alignment.center,height: 310,
                                child:PageView(
                                  scrollDirection:Axis.horizontal ,
                                  controller: gec,
                                  onPageChanged: (change){

                                  },
                                  reverse: true,
                                  children:get(context,Secildi),
                                ),
                            ),
                          ],),
                        ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Container(
                                color:colorDarkSecondary,
                                alignment: Alignment.center,
                                height: 25,
                                child: Text("Yapılan Etkinlik Sayısı",style: TextStyle(color: Colors.white),),
                              ),
                              SizedBox(height: 10,),
                              Container(alignment: Alignment.center,height: 125,child: Text(EtkinlikYapildi.toString(),
                                style: TextStyle(color: Colors.white,fontSize: 50),),),
                            ],),
                          ]),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Column(children: [
                              Container(
                                color:colorDarkSecondary,
                                alignment: Alignment.center,
                                height: 25,
                                child: Text("Alan değiştir",style: TextStyle(color: Colors.white),),
                              ),
                              SizedBox(height: 10,),
                              Container(alignment: Alignment.center,height: 125,
                                child: PageView(
                                    children: [
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color: Secildi=="Dans"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=Etkinlikdans.length;

                                          setState(() {
                                            Secildi="Dans";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Dans",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Dans"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color: Secildi=="Edebiyat"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikEdebiyat.length;

                                          setState(() {
                                            Secildi="Edebiyat";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Edebiyat",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Edebiyat"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color:Secildi=="Fotoğrafçılık"?Colors.limeAccent: Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikFotografcilik.length;

                                          setState(() {
                                            Secildi="Fotoğrafçılık";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Fotoğrafçılık",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Fotoğrafçılık"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color:  Secildi=="Müzik"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikMuzik.length;

                                          setState(() {
                                            Secildi="Müzik";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Müzik",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Müzik"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color:  Secildi=="Masa Oyunları"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikMasaOyun.length;

                                          setState(() {
                                            Secildi="Masa Oyunları";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Masa Oyunları",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Masa Oyunları"?Colors.limeAccent: Colors.white),)),), Container(alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color:Secildi=="Tarih"?Colors.limeAccent:  Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikTarih.length;

                                          setState(() {
                                            Secildi="Tarih";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Tarih",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Tarih"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color: Secildi=="Tasarım"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikTasarim.length;

                                          setState(() {
                                            Secildi="Tasarım";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Tasarım",style: GoogleFonts.adventPro(fontSize: 20,color:  Secildi=="Tasarım"?Colors.limeAccent:Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color:  Secildi=="Teknoloji"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikTeknoloji.length;

                                          setState(() {
                                            Secildi="Teknoloji";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Teknoloji",style: GoogleFonts.adventPro(fontSize: 20,color:  Secildi=="Teknoloji"?Colors.limeAccent:Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color: Secildi=="Spor"?Colors.limeAccent: Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikSpor.length;

                                          setState(() {
                                            Secildi="Spor";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Spor",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Spor"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color:  Secildi=="Resim"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          SecilenAlanEtkinlik=EtkinlikResim.length;

                                          setState(() {
                                            Secildi="Resim";
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Resim",style: GoogleFonts.adventPro(fontSize: 20,color: Secildi=="Resim"?Colors.limeAccent: Colors.white),)),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color: Secildi=="Yemek Yapmak"?Colors.limeAccent:Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          setState(() {
                                            Secildi="Yemek Yapmak";
                                            SecilenAlanEtkinlik=EtkinlikYemek.length;
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Yemek",style: GoogleFonts.adventPro(fontSize:20,color:Secildi=="Yemek Yapmak"?Colors.limeAccent:Colors.white),),),),
                                      Container(alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2,color: Secildi=="Yoga"?Colors.limeAccent: Colors.white),
                                        ),
                                        child:TextButton(onPressed: (){
                                          Secildi="Yoga";
                                          SecilenAlanEtkinlik=EtkinlikYoga.length;
                                          setState(() {
                                            SecilenAlan=Secildi;
                                          });
                                        },child: Text("Yoga",style: GoogleFonts.adventPro(fontSize: 20,color:  Secildi=="Yoga"?Colors.limeAccent:Colors.white),)),),
                                    ],
                                  ),
                              ),
                            ],),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),),
      ],
    );
  }

  void SecimDosya(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("Galeriden Fotoğraf Seç"),
            onTap: (){
              SecimYukle(ImageSource.gallery);
            },
          ),
          ListTile(
            title: Text("Kameradan Fotoğraf Çek"),
            onTap: (){
              SecimYukle(ImageSource.camera);
            },
          ),
        ],
      ),
    ));
  }
  void Uyari(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text("Bu etkinlik sizde var.")],
      ),
    ));
  }
  void Uyarit(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Text("Eklendi",style: TextStyle(color: Colors.green),)],
      ),
    ));
  }
  void SecimYukle(ImageSource source) async{
    final picker=ImagePicker();
    final secilen=await picker.getImage(source: source);
    setState(() {
      if(secilen!=null){
        SeciliDosya=File(secilen.path);
        SeciliDosyaYolu=secilen.path;
        print(SeciliDosyaYolu);
        tut();

      }
    });
    Navigator.pop(context);

  }

  get(BuildContext context,String a) {
    switch(a){
      case "Dans":
        return Etkinlikdans.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

        case "Edebiyat":
        return EtkinlikEdebiyat.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

        case "Fotoğrafçılık":
        return EtkinlikFotografcilik.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

      case "Müzik":
        return EtkinlikMuzik.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

      case "Masa Oyunları":
        return EtkinlikMasaOyun.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

      case "Tarih":
        return EtkinlikTarih.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

      case "Tasarım":
        return EtkinlikTasarim.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;


      case "Teknoloji":
        return EtkinlikTeknoloji.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

      case "Spor":
        return EtkinlikSpor.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;


      case "Resim":
        return EtkinlikResim.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;


      case "Yemek Yapmak":
        return EtkinlikYemek.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;

      case "Yoga":
        return EtkinlikYoga.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
        break;
      default:
        return EtkinlikSpor.map((e) => Stack(
          children: [
            Container(
              alignment: Alignment.center,
              color: colorLightPrimary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            ),
            Positioned(
              bottom: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.green,
                    child: TextButton(onPressed: (){
                      for(int i=0;i<BenimEtkinligim.length;i++){
                        if(BenimEtkinligim[i]==e){
                          BenimEtkinligim.removeAt(i);
                          Uyari(context);
                          uyar=true;
                          Future.delayed(Duration(seconds: 1),(){
                            Navigator.pop(context);
                          });
                        }
                      }
                      if(uyar==false){
                        Uyarit(context);
                        Future.delayed(Duration(seconds: 1),(){
                          Navigator.pop(context);
                        });
                      }
                      BenimEtkinligim.add(e);
                      // tut();

                    },child: Text("Etkinliği Ekle",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),),
                  ),
                  Container(
                    color:Colors.red,
                    child: TextButton(onPressed: (){
                      setState(() {
                        i++;
                        if(i>EtkinlikSpor.length){
                          i=0;
                        }
                        print(i);
                        gec.animateToPage(i, duration: Duration(milliseconds: 900), curve:Curves.bounceInOut);
                      });
                    },child:Text("Etkinliği Geç  ",style: TextStyle(
                      color: Colors.black,
                    ),
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(SecilenAlan,style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),

          ],
        )).toList();
    }
  }
}
// ListView.builder(
// itemCount: SecilenAlanEtkinlik,
// itemBuilder: (
// context,index){
// return ListTile(
// title:Text(EtkinlikSpor[index],style: TextStyle(color: Colors.white,fontSize: 10),),
// );
// }),