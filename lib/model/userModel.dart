class UserModel {
  String id;
  String firstname;
  String lastname;
  String phone;
  String email;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "email": email,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "phone": phone,
      "email": email,
    };
  }

  Map<String, dynamic> toJsonDelete() {
    return {
      "id": id,
    };
  }
}
