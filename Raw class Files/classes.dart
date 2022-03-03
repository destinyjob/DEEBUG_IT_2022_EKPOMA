//@dart = 2.11
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
  Person human = Person(21);
  print(human.height);
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

  Person(double height) {
    this.height = height;
  }
}
