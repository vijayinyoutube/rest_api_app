class DemoModel {
  final String name;
  final String userName;
  final String email;

  DemoModel({required this.userName, required this.email, required this.name});

  factory DemoModel.fromJson(Map<String, dynamic> json) {
    return DemoModel(
      name: json["name"],
      userName: json["username"],
      email: json["email"],
    );
  }
}
