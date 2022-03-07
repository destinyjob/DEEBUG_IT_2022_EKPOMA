void main() {
  neandarthal n = neandarthal();
  Human h = Human();
  // h.walk();
  n.walk();
  n.speak();
}

//This is a parent class or a super class
class Human {
  void walk() {
    print('Humans walk!');
  }
}

//This is the child class of class Animal
class Person extends Human {
  void speak() {
    print('That person can speak');
  }
}

class neandarthal extends Person {
  @override
  void speak() {
    super.speak();
    print('i am speaking');
  }

  @override
  void walk() {
    super.walk();
    print('adding extra functionality');
  }
}
