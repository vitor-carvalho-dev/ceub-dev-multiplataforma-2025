class Post {
  String id;
  String profileImageUrl;
  String comment;
  String timestamp;

  Post(this.id, this.profileImageUrl, this.comment, this.timestamp);

  Post.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      profileImageUrl = json['profileImageUrl'],
      comment = json['comment'],
      timestamp = json['timestamp'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'profileImageUrl': profileImageUrl,
    'comment': comment,
    'timestamp': timestamp,
  };
}
