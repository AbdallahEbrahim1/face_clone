class UserDataModel {
  late final String name;
  late final String imageUrl;
  UserDataModel({
    required this.name,
    required this.imageUrl,
  });
  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
  }
}
