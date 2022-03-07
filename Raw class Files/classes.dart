//@dart = 2.11
import 'dart:io';

void main() {
  // OperationDeebug deebug = OperationDeebug();

  // deebug.profile(20, 5);
  // deebug.name = 'Ighalo';
  // deebug.accountBalance = 0;
  // deebug.bankStatement = 'theif';

  // print(deebug.name);
  // print(deebug.accountBalance);
  // print(deebug.bankStatement);

  // Person operations = Person();

  // String name = 'Destiny';
  // Person human = Person();
  String branch = stdin.readLineSync().toString();
  Person h2 = Person.namedConst(branch);
  // Person h3 = Person.kelvin('I sleep too much');
}

class Person {
//Fields or instance variables
  // String name;
  // var userName = 'Scott';
  // String bankStatement;
  // double accountBalance;

  // //Method
  // profile(int birthYear, currrentYear) {
  //   print('$userName is ${birthYear - currrentYear} years old');
  // }

  double height;
  //This is as no-arg constructor
  // Person() {print('Kelvin is dosing');}

  //This a parameterized constructor
  // Person(String str, int age) {
  //   print(str);
  //   print(age);
  // }

  //Named constructor

  Person() {
    print('My name is Destiny');
  }

  Person.namedConst(String branch) {
    print('I am in $branch');
  }

  Person.kelvin(String sleep) {
    print(sleep);
  }
}
