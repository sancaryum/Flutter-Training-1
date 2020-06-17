import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  print("sa");

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "App1";
  var students = ["Hakan kakız","Safa","Tarık"];
  @override
  Widget build(BuildContext context) {//build metodu bizim widget döndürmemizi istiyor



    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body:

        buildBody(context) //body içinde de widget türünde bi şey olmalı

    );

    throw UnimplementedError();
  } //kendi witgetimizi ooluştururken StatelessWidgettan miras almak zorundayız

  String resultOfExam(int not){

    String message = "";
    if (not >= 50)
      message = "Passed";
    else
      message = "Not Passed";

    return message;
  }

  void showMessage(BuildContext context,String message){ //contaxt ister

    var alert1 = AlertDialog(
      //art dialog yapısı oluşturduk
      title: Text("Result of exam"),
      content: Text(message),
    );
    //showDialog yazmadan göstermez
    showDialog(
        context: context,
        builder: (BuildContext context) =>
        alert1); //BuildContexte hangi alerti göstermesi gerektiğini yazıyoruz

  }

  Widget buildBody(BuildContext context) {
    //body içinde de widget türünde bi şey olmalı

    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(//ListViewin builderi itemCount kadar itemBuilder bloğunu çalıştırmaya yarar
                itemCount: students.length,

                itemBuilder: (BuildContext context, int index ){
                  return Text(students[index]);//for döngüsündeki i gibi
                })
        ),
        Center(
          child: RaisedButton(
            child: Text("Sonucu gör"),
            onPressed: () {
              //butona basarsa

              var message = resultOfExam(0);

              //Burdaki context widget ağacının kendi contextinden gelir
              showMessage(context,message);


            },
          ),
        ),
      ],
    );



  }
}
