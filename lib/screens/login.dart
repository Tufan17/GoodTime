import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController isim=TextEditingController();
  TextEditingController sifre=TextEditingController();
  TextEditingController sifretekrar=TextEditingController();
  TextEditingController soyisim=TextEditingController();
  TextEditingController kulaniciadi=TextEditingController();
  TextEditingController yas=TextEditingController();
  bool Yeniuye=false;
  String kaydedildi="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image:DecorationImage(
              fit: BoxFit.fill,
              image:Gun=="Gündüz"?AssetImage("assets/image/bulut.jpg"):
              AssetImage("assets/image/login1.png"),
            ),
          ),
          child: Yeniuye==true? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 310,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Kulanıcı Adı / E-Posta",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,

                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: kulaniciadi,
                            decoration:InputDecoration(
                              border: OutlineInputBorder(),
                            ) ,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("İsim"
                            ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,

                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: isim,
                            decoration:InputDecoration(
                              border: OutlineInputBorder(),
                            ) ,
                          ),
                        ), Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Soyisim"
                            ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,

                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: soyisim,
                            decoration:InputDecoration(
                              border: OutlineInputBorder(),
                            ) ,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Şifre"
                            ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,

                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            controller: sifre,
                            decoration:InputDecoration(
                              border: OutlineInputBorder(),
                            ) ,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Şifre Tekrar"
                            ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,

                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            controller: sifretekrar,
                            decoration:InputDecoration(
                              border: OutlineInputBorder(),
                            ) ,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: TextButton(
                              onPressed: (){
                                  if(sifretekrar.text==sifre.text&&sifre.text!=""){
                                    Sifre=sifre.text;
                                    UserName=kulaniciadi.text;
                                    Isim=isim.text;
                                    Soyisim=soyisim.text;

                                    setState(() {tut();
                                    hafiza();
                                    print(Sifre);
                                    print(UserName);
                                    print(Isim);
                                    print(Soyisim);
                                      kaydedildi="Kaydedildi";
                                    });
                                    Future.delayed(Duration(seconds:2),(){
                                      setState(() {
                                        Yeniuye=!Yeniuye;
                                      });
                                    });
                                  }else{
                                    print("şifre hatalı");
                                    setState(() {
                                      kaydedildi="Kaydedilmedi";
                                    });

                                  }




                              },child: Text("Üye Ol",style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),),
                            ),
                          ),
                        ),
                        kaydedildi!="Kaydedilmedi"?Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(kaydedildi,style: TextStyle(color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                        ),),):Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(kaydedildi,style: TextStyle(color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ):
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(width: 1,),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 310,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Kulanıcı Adı / E-Posta",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,

                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration:InputDecoration(
                                border: OutlineInputBorder(),
                              ) ,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Şifre"
                              ,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,

                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration:InputDecoration(
                                border: OutlineInputBorder(),
                              ) ,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: (){

                                  },
                                  child: Text("Şifreyi unuttum" ,style: TextStyle(
                                    decoration:TextDecoration.underline,
                                    fontSize: 15,
                                    color: Colors.red,
                                  ),),
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(Icons.verified_sharp,color:Colors.black12), onPressed: (){

                                      setState(() {
                                      });
                                    }),
                                    Text("Beni Hatırla"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green,
                              ),
                              child: TextButton(
                                onPressed: (){
                                },child: Text("Üye Giriş",style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),),
                              ),
                            ),
                          ),
                          Center(child: Text("-----  Veya  -----",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.indigo[700],
                              ),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.network("https://www.cepde.net/sabit/icerik/resimler/2017/facebook_lite.jpg",width: 35,height: 35,),
                                    TextButton(
                                      onPressed: (){
                                        Uyarit1(context);
                                        Future.delayed(Duration(seconds: 3),(){
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text("Facebook ile Giriş Yap",style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("<- Geri",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                ),
                              ),
                              TextButton(onPressed: (){
                                Yeniuye=true;
                                setState(() {

                                });
                              },child: Text("Yeni Üyeliki!",style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),),),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
  void Uyarit1(BuildContext context) {
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Henüz Bu Özellik Aktif Değil",style: TextStyle(color: Colors.black),)],
      ),
    ));
  }

}
