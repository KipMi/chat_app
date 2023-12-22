class UserC {
  final String id;
  final String email;
  final String password;
  final String username;
  final String firstName;
  final String lastName;

  UserC(
      {required this.id,
      required this.email,
      required this.password,
      required this.username,
      required this.firstName,
      required this.lastName});

  factory UserC.fromJson(Map<String, dynamic> json) => UserC(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name']);

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'email' : email,
      'password' : password,
      'username' : username,
      'first_name' : firstName,
      'last_name' : lastName
    };
  }
}
