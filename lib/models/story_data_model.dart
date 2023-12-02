class StoryDataModel {
  late final String id;
  late final String userNameStory;
  late final String userImageUrlStory;
  late final String imageUrl;

  StoryDataModel({
    required this.id,
    required this.userNameStory,
    required this.userImageUrlStory,
    required this.imageUrl,
  });

  StoryDataModel.fromJson(Map<String, dynamic> json, String id) {
    id = id ?? "";
    userNameStory = json['userNameStory'] ?? "";
    userImageUrlStory = json['userImageUrlStory'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
  }
}
