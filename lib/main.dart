import 'package:app1/Modals/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  print("sa");

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Student Report System";
  List<Student> students = [
    Student("Yasin", "Er", 21),
    Student("Hasan", "Yılmaz", 65),
    Student("Mehmet", "Gelve", 53)
  ];


  @override
  Widget build(BuildContext context) {
    //build metodu bizim widget döndürmemizi istiyor


    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body:

        buildBody(context) //body içinde de widget türünde bi şey olmalı

    );

    throw UnimplementedError();
  } //kendi witgetimizi ooluştururken StatelessWidgettan miras almak zorundayız

  String resultOfExam(int not) {


  }

  void showMessage(BuildContext context, String message) {
    //contaxt ister

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
            child:

            ListView
                .builder( //ListViewin builderi itemCount kadar itemBuilder bloğunu çalıştırmaya yarar
                itemCount: students.length,

                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2019/05/16/16/50/man-4207514_1280.jpg") ,
                    ) ,
                    title: Text(students[index].firstName + " " +
                        students[index].lastName),
                    subtitle: Text(
                        "Result: " + students[index].grade.toString()),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      print(students[index].firstName + " " +
                          students[index].lastName);
                    },

                  );
                })
        ),
        Center(
          child: RaisedButton(
            child: Text("Sonucu gör"),
            onPressed: () {
              //butona basarsa

              var message = resultOfExam(0);

              //Burdaki context widget ağacının kendi contextinden gelir
              showMessage(context, message);
            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    //Icon bir widgettır


    if (grade >= 50)
      return Icon(Icons.done);
    else
      return Icon(Icons.clear);
  }

}