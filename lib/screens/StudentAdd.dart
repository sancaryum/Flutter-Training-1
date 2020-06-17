import 'package:app1/Modals/student.dart';
import 'package:app1/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  //Mainden aldığımız students listesininin objelerini oluşturuyoruz
  List<Student> students;
  //Studentkardan oluşmuş liste vererek obje oluşturuyoruz
  StudentAdd(List<Student> students){
    this.students=students;

  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students=students;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new Sturent"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0), //Container için her taraftan 20 lik boşluk bırakır
          child: Form(
            key: formKey, //Bu formun erişim keyi feromKey oluyor.
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      //Widget döndüreceğiz dedik ve textformfield da bir widget olduğu için widget döndürdük.
      decoration:
          InputDecoration(labelText: "Student's name:", hintText: "Örn: Yasin"),
      validator:
          validateFirstName, //girilen veriyi yazdığımız metod sayesinde kontrol ediyoruz
      onSaved: (String value) {
        //Değer girilip bitire basıldığı zaman. Ayrıca string türünde bir alan verileceğini söylüyoruz
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      //Widget döndüreceğiz dedik ve textformfield da bir widget olduğu için widget döndürdük.
      decoration:
      InputDecoration(labelText: "Student's last name", hintText: "Örn: Yılmaz"),
      validator: validateLastName, //girilen veriyi yazdığımız metod sayesinde kontrol ediyoruz
      onSaved: (String value) {
        //Değer girilip bitire basıldığı zaman. Ayrıca string türünde bir alan verileceğini söylüyoruz
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      //Widget döndüreceğiz dedik ve textformfield da bir widget olduğu için widget döndürdük.
      decoration:
      InputDecoration(labelText: "Student's grade:", hintText: "Örn: 87"),
      validator: validateGrade, //girilen veriyi yazdığımız metod sayesinde kontrol ediyoruz
      onSaved: (String value) {
        //Değer girilip bitire basıldığı zaman. Ayrıca string türünde bir alan verileceğini söylüyoruz
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child:
      Text("Save"),
      onPressed:(){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          print("Eklendi:" + student.firstName + " " + student.lastName);

          Navigator.pop(context);
        }


      },
    );

  }

  void saveStudent() {

  }


}
