import 'package:app1/Modals/student.dart';
import 'package:app1/screens/StudentAdd.dart';
import 'package:flutter/material.dart';

void main() {
  print("sa");

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Student Report System";

  Student selectedStudent = Student.withId(0, "", "", 0);


  List<Student> students = [
    Student.withId(1,"Yasin", "Er", 100),
    Student.withId(2,"Hasan", "Yılmaz", 65),
    Student.withId(3,"Mehmet", "Gelve", 45)
  ];

  @override
  Widget build(BuildContext context) {
    //build metodu bizim widget döndürmemizi istiyor

    return Scaffold(
        appBar: AppBar(
          title: Text(mesaj),
        ),
        body: buildBody(context) //body içinde de widget türünde bi şey olmalı

        );

    throw UnimplementedError();
  }

  String resultOfExam(int not) {}

  void showMessage(BuildContext context, String message) {
    //contaxt ister

    var alert1 = AlertDialog(
      //art dialog yapısı oluşturduk
      title: Text("İşlem:"),
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
            ListView.builder(
                //ListViewin builderi itemCount kadar itemBuilder bloğunu çalıştırmaya yarar
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {


                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2019/05/16/16/50/man-4207514_1280.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Result: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                }),),
        Text("Selected student: " + selectedStudent.firstName),
        Row(
          children: <Widget>[

            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color:Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("New student"),
                  ],
                ),
                onPressed: () {
                  //butona basarsa
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));


                },
              ),
            ),


            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0),//guncelle butonundan sonra 5 lik boşluk koy.
                    Text("Update"),
                  ],
                ),
                onPressed: () {
                  //butona basarsa
                  //Burdaki context widget ağacının kendi contextinden gelir
                  showMessage(context, "Updated!");
                },
              ),
            ),


            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.deepOrange,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 20.0),
                    //Text("Delete"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });




                  //Burdaki context widget ağacının kendi contextinden gelir
                  showMessage(context, selectedStudent.firstName + " deleted!");
                },
              ),
            ),

          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    //Icon bir widgettır

    if (grade >= 50)
      return Icon(Icons.done);
    else if (grade >= 40 && grade < 50)
      return Icon(Icons.album);
    else
      return Icon(Icons.clear);
  }

  Widget listeCiz() {


  }
}
