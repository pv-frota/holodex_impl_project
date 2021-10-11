import 'package:holodex_impl_project/entity/channel.dart';
import 'package:holodex_impl_project/util/abstract_converter.dart';

final channelConverterInstance = ChannelConverter();

class ChannelConverter implements AbstractConverter<Channel> {
  @override
  Channel fromJson(Map<String, dynamic> json) {
    return Channel(
        id: json['id'].toString(),
        name: json['name'].toString(),
        englishName: json['english_name'].toString(),
        org: json['org'].toString(),
        group: json['group'].toString(),
        clipCount: json['clip_count'].toString(),
        photo: json['photo'].toString(),
        subscriberCount: json['subscriber_count'].toString(),
        twitter: json['twitter'].toString(),
        type: json['type'].toString(),
        videoCount: json['video_count'].toString());
  }

  @override
  List<Channel> fromJsonList(List jsonList) {
    if (jsonList.isEmpty) {
      return [];
    }
    return jsonList.map((e) => fromJson(e)).toList();
  }

  @override
  Map<String, dynamic> toJson(Channel entity) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
