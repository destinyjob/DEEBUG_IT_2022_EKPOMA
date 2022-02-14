void main() {
  // add(2, 2.5);
  // subtract(two: 2.5, one: 2);

  mutiply(5, 4);
  mutiply(5, 4, 3);
  divide(4, 5, 8);
  modulus(2, b: 3, c: 2);
}

//Fucntion with positional parameters
void add(int one, double two) {
  print(one + two);
}

//Function with named parameters
void subtract({int? one, double? two}) {
  print(one! + two!);
}

//Fuction with a positional optional parameter
void mutiply(int x, int y, [int? z]) {
  int sum = x + y;
  if (z != null) {
    sum += z;
  } else {
    print("The value of z is: $z");
  }
  print(sum);
}

//Function with default parameters
void divide(int x, int y, [int z = 7]) {
  int sum = x + y + z;
  print(sum);
}

//Function with a named parameter and a positional parameter
void modulus(int a, {int? b, int? c}) {
  print(a + b! + c!);
}
