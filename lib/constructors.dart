import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main(){

  WorkersManager wm = new WorkersManager();

  //var wm = new WorkersManager(); //bu şekilde de tanımlanabilir
  //var wm = WorkersManager(); //şeklinde new yazmasak da olur
  wm.add();
  wm.guncelle();

  //İstediğimiz constructordan obje üretip referansa atıyoruz.
  Customer customer1 = new Customer.withInfo("Yasin", "Eryiğit");


  CustomerManager cm = CustomerManager();
  cm.add(customer1);



}


class WorkersManager{
  void add(){
    print("Eklendi");
  }

  void guncelle(){
    print("Güncellendi");
  }

  void sil(){
    print("Silindi");
  }
}

class CustomerManager{
  //Objenin özelliklerini vermek hata çıkarabilir ,
  //o yüzden direkt olaran objeyi veriyoruz.
  void add(Customer customer){
    print("Eklendi: " + customer.firstName + " " + customer.lastName);
  }

  void guncelle(){
    print("Güncellendi");
  }

  void sil(){
    print("Silindi");
  }


}

class Customer extends Person{

  Customer(){

  }

  Customer.withInfo(String firstName, String lastName){
    this.firstName=firstName;
    this.lastName=lastName;
  }


}

class Workers extends Person{

  int dateOfStart;

  Workers(){

  }

  Workers.withInfo(String firstName, String lastName,int dateOfStart){
    this.firstName=firstName;
    this.lastName=lastName;
    this.dateOfStart=dateOfStart;
  }


}

class Person{
  String firstName,lastName;
  int idNumber;
}

