void main() {
  Deebug deebuger = Deebug();

  //Calling the setName method(setter method we created) to set the value in the field 'deebugUsername'
  deebuger.setName = 'John Mote';
  deebuger.setAge = 2;
  //Calling the get_name method(getter method we created) to set the value in field 'deebugUsername'
  print('Welcome ${deebuger.getName}');
  print('This is deebug age ${deebuger.getAge}');
}

class Deebug {
  String? deebugUsername;
  int? deebugAge;
  //Creating a setter method
  set setName(String name) {
    deebugUsername = name;
  }

  set setAge(int age) {
    deebugAge = age;
  }

  //Creating a getter method
  String? get getName {
    return deebugUsername;
  }

  int? get getAge {
    return deebugAge;
  }
}
