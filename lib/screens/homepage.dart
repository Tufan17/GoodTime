import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';
import 'package:goodtime/screens/login.dart';
import 'package:goodtime/screens/profil.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay _timeOfDay=TimeOfDay.now();
  String Sayfa="Home";
  int Sayacdakika=30;
  int Sayacsaniye=0;
  bool EtkinlikBasla=false;
  static const Color colorDarkPrimary = Color(0xFF222831);
  static const Color colorDarkSecondary = Color(0xFF30475E);
  @override
  void initState() {
    hafiza();
    super.initState();
    new Timer.periodic(Duration(seconds: 1), (timer) {
      if(EtkinlikBasla==true){
        setState(() {
          if(Sayacsaniye==0){
            Sayacsaniye=59;
            Sayacdakika--;
          }else{
            Sayacsaniye--;
          }
          if(Sayacdakika==0&&Sayacsaniye==0){
            Uyaribitti(context);
            Future.delayed(Duration(seconds: 5),(){
              Navigator.pop(context);
            });
          }
        });
      }

      if(_timeOfDay.minute!=TimeOfDay.now().minute){
        setState(() {
          _timeOfDay=TimeOfDay.now();

        });
      }
    });
    if(_timeOfDay.hour>=6 && _timeOfDay.hour<=18){
      Gun="Gündüz";
    }else{
      Gun="Gece";
    }
    // for(int i=0;BenimEtkinligim.length>=0;i++){
    //   BenimEtkinligim1.add(BenimEtkinligim[i]);
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Sayfa=="Home"?BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image:Gun=="Gündüz"?AssetImage("assets/image/daytime.jfif")
              :AssetImage("assets/image/gece.jpg"),),
        ):BoxDecoration(
          color: colorDarkPrimary,
        ),
        child:UserName=="Kullanıcı Adı"?
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    _timeOfDay.hour<10?Text("0${_timeOfDay.hour}:",style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 75,
                      color: Colors.white,),):Text("${_timeOfDay.hour}:",style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 75,
                      color: Colors.white,),),
                    _timeOfDay.minute<10?Text("0${_timeOfDay.minute}",style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 75,
                      color: Colors.white,
                    ),):Text("${_timeOfDay.minute}",style:TextStyle(

                      fontWeight: FontWeight.w400,
                      fontSize: 75,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: TextButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              },child: Text("Kayıt Ol",style: TextStyle(fontSize: 40,color:Colors.white),)),),
            ),
          ],
        ):
        Column(
          children: [
            Expanded(flex:15,
              child:Sayfa=="Home"?
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          _timeOfDay.hour<10?Text("0${_timeOfDay.hour}:",style:TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 75,
                            color: Colors.white,),):Text("${_timeOfDay.hour}:",style:TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 75,
                            color: Colors.white,),),
                          _timeOfDay.minute<10?Text("0${_timeOfDay.minute}",style:TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 75,
                            color: Colors.white,
                          ),):Text("${_timeOfDay.minute}",style:TextStyle(

                            fontWeight: FontWeight.w400,
                            fontSize: 75,
                            color: Colors.white,
                          ),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight:Radius.circular(15),topLeft: Radius.circular(15)),
                        color: Colors.black45,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:30.0,right:30.0),
                            child: Text("Etkinlikler",style:GoogleFonts.sigmarOne(
                              color: Colors.white,
                              fontSize: 25,
                            ),),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 250,
                            child: PageView(
                              children:BenimEtkinligim.map((e) => Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 40,left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(e==""?"Henüz etkinlik seçilmedi.":e,style: TextStyle(fontSize: 20,color:Colors.white,),),
                                  ),
                                  Positioned(
                                    bottom: 100,
                                    left: 140,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                    Text(Sayacdakika<10?"0"+Sayacdakika.toString():Sayacdakika.toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                                    Text(":",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                                    Text(Sayacsaniye<10?"0"+Sayacsaniye.toString():Sayacsaniye.toString(),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ],),),
                                  Positioned(
                                      bottom: 10,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 340,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:50),
                                              child: e==""?Container():Column(
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          border: Border.all(width: 2,color: Colors.white),
                                                        ),
                                                        child: TextButton(
                                                          onPressed: (){

                                                        setState(() {
                                                          EtkinlikBasla=!EtkinlikBasla;

                                                        });
                                                          },
                                                          child: Text(EtkinlikBasla==true?"Etkinliği Durdur":Sayacdakika==30?"Etkinliğe Başla":"Etkinliğe Devamet",style: TextStyle(
                                                          fontSize: 15,color: Colors.white,
                                                        ),),),
                                                      ),
                                                      Container(decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(width: 2,color: Colors.white),
                                                      ),
                                                        child: EtkinlikBasla==true?TextButton(
                                                          onPressed: (){
                                                            Sayacdakika=30;
                                                            Sayacsaniye=0;
                                                            EtkinlikBasla=false;
                                                            setState(() {


                                                            });
                                                          },
                                                          child: Text("Etkinliği yenile",style: TextStyle(
                                                            fontSize: 15,color: Colors.white,
                                                          ),),):TextButton(
                                                          onPressed: (){
                                                            setState(() {
                                                              UyariE(context);
                                                            });
                                                          },
                                                          child: Text("Etkinliği Sil",style: TextStyle(
                                                          fontSize: 15,color: Colors.white,
                                                        ),),),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ):
              PRofil(),
            ),
            Expanded(flex:1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  color:Gun=="Gece"?Colors.blue[900]:Colors.green,
                ),
                child: Row(
                  children: [
                    Expanded(child: IconButton(onPressed: (){
                      setState(() {
                        Sayfa="Home";
                      });
                    },icon: Icon(Icons.home,color: Colors.white,size: 30,))),
                    Expanded(child: IconButton(onPressed: (){
                      setState(() {
                        Sayfa="Profil";
                        print(Sayfa);
                      });
                    },icon: Icon(Icons.person,color: Colors.white,size: 30,))),
                  ],),),),],
        ),
      ),
    );
  }
  void UyariE(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text("Silmek istediğine emin misin?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed:(){
                setState(() {
                  BenimEtkinligim.clear();
                  Future.delayed(Duration(seconds: 1),(){
                    Navigator.pop(context);
                  });
                });
              },child: Text("Evet",style: TextStyle(color: Colors.red),)),
              TextButton(onPressed: (){
                Future.delayed(Duration(seconds: 1),(){
                  Navigator.pop(context);
                });
              },child: Text("iptal",style: TextStyle(color: Colors.green),)),
            ],
          ),
      ],
      ),
    ));
  }
    void Uyaribitti(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text("Etkinlik Bitti"),
          ),
      ],
      ),
    ));
    BenimEtkinligim.clear();
    EtkinlikYapildi++;
  }
}
