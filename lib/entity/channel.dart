class Channel {
  String id;
  String name;
  String englishName;
  String type;
  String org;
  String group;
  String photo;
  String twitter;
  String videoCount;
  String subscriberCount;
  String clipCount;

  Channel(
      {required this.name,
      required this.id,
      required this.englishName,
      required this.type,
      required this.org,
      required this.group,
      required this.photo,
      required this.twitter,
      required this.videoCount,
      required this.subscriberCount,
      required this.clipCount});

  @override
  String toString() {
    return name;
  }
}
