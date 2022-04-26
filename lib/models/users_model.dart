class UsersModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UsersModel(this.id, this.email, this.firstName, this.lastName, this.avatar);

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      json['id'],
      json['email'],
      json['first_name'],
      json['last_name'],
      json['avatar'],
    );
  }
}
