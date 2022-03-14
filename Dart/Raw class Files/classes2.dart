void main() {
  A a = A(); //Creating an object of the class

  A b = A();

  // A.age; // Accesing static variables
  A.age = 34;
  a.name = 'Destiny';
  b.name = 'Ighalo';
  a.add();

  print(a.name);
  print(b.name);
  print(A.age);
}

class A {
  // static const a = 4;
  static int? age;
  String? name;

  void add() {
    print('My age is $age');
    print('My name is $name');
  }
}
