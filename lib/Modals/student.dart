class Student{
String firstName, lastName,_status;
int grade,id;

Student.withId(int id,String firstName, String lastName,int grade){
  this.id=id;
  this.firstName=firstName;
  this.lastName=lastName;
  this.grade =grade;

}

Student(String firstName, String lastName,int grade){
  this.firstName=firstName;
  this.lastName=lastName;
  this.grade =grade;

}

Student.withoutInfo(){

}

String get getFirstName{
  return "OGR - " + this.firstName;
}

void set setFirstName(String value){
  this.firstName=value;
}

String get getStatus{

  if(this.grade>=50)
    return "Geçti";
  else if(this.grade>=40&&this.grade<50)
    return "Büte kaldı";
  else
    return "Kaldı";

}




}

