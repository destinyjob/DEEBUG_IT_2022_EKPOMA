import 'dart:math';

//Global declaration
int a = 5;
main() {
  // print('Testing testing');
  // //Calling the function
  // Age();
  // print('Testing testing');
  //Text();
  //Print('Destiny');
  //Built in function
  // double ran = Random().nextDouble();
  // print(ran);
  // print(pi);
  // print(sqrt(4));
  double c = add(7, 2);
  print(c);
  //print(c);
  // add(10, 15);
  // add(50000, 4000);
  name();
}

//Function definition
// void Age() {
//   print('age');
// }

//This function has no parameters meaning it receives nothing
// void Text() {
//   print("text");
// }

//This function has a p
// void Print(String text) {
//   print(text);
// }

double add(double a, int b) {
  double c;
  c = a + b;
  return c;
}

//Function declaration using fat arrow
void name() => print(a);
