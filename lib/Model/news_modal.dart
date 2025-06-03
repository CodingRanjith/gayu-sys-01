class News {
  String id;
  String detail;
  String heading;
  String topic;
  bool? isFavourite;
  List<String>? tags;

  News(
    this.id,
    this.detail,
    this.heading,
    this.topic,
    this.isFavourite,
    this.tags,
  );
}
