class PostDataModel {
  late final String id;
  late final String userName;
  late final String userImageUrl;
  late final String caption;
  late final String timeAgo;
  late final String imageUrl;
  late final String likes;
  late final String comments;
  late final String shares;

  PostDataModel({
    required this.id,
    required this.userName,
    required this.userImageUrl,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json, String id) {
    return PostDataModel(
      id: id,
      userName: json['userName'] ?? "",
      userImageUrl: json['userImageUrl'] ?? "",
      caption: json['caption'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      likes: json['likes'] ?? "",
      shares: json['shares'] ?? "",
      comments: json['comments'] ?? "",
    );
  }
}
