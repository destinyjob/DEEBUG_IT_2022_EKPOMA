class User {
  String? name;
  String? email;
  String? username;


  User({
    required this.name,
    required this.email,
    required this.username,
  });

  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    username = json['username'];
  }
}