class CommentDataModel {
  late final String text;
  late final String time;
  late final String ownerName;
  late final String ownerImage;

  CommentDataModel.fromJson(Map<String, dynamic> json) {
    text = json['text'] ?? '';
    time = json['time'] ?? '';
    ownerName = json['ownerName'] ?? '';
    ownerImage = json['ownerImage'] ?? '';
  }
}
