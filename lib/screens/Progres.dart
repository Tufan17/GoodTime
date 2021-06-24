import 'package:flutter/material.dart';
import 'package:goodtime/constants/const.dart';
import 'package:goodtime/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class Etkinlik extends StatefulWidget {
  @override
  _EtkinlikState createState() => _EtkinlikState();
}

class _EtkinlikState extends State<Etkinlik> {

  @override
  void initState() {
    hafiza();
    // TODO: implement initState
    super.initState();
    print(Secildi);
    Color secililer=Colors.yellow;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarkPrimary,
      appBar: AppBar(
        title: Text("Etkinlikler"),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
        },),
        backgroundColor:colorDarkPrimary ,
        centerTitle: true,
      ),
      body:Container(
        child:SwitchDongu(SecilenAlan),
    ),

    );
  }

  SwitchDongu(String secildi) {
   // print(secildi);
    switch (secildi){
      case "Spor":
       return ListView.builder(
           itemCount: EtkinlikSpor.length,
           itemBuilder: (
               context,index){
              return ListTile(
                selectedTileColor: Colors.white12,
                title:TextButton(onPressed: (){
                  BenimEtkinligim.add(EtkinlikSpor[index]);
                  print(BenimEtkinligim);
                },child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(EtkinlikSpor[index],style: TextStyle(color: Colors.white,fontSize: 20),))),
              );
            });
        break;
      default:
        print("boş");
        break;

  }
  }
  }
