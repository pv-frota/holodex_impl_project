import 'package:holodex_impl_project/converter/channel_converter.dart';
import 'package:holodex_impl_project/entity/channel.dart';
import 'package:holodex_impl_project/util/http_client.dart';

final channelServiceInstance = ChannelService();

class ChannelService {
  Future<List<Channel>> getChannelList({int? lastPos}) async {
    String path = "/channels";
    if (lastPos != null) {
      path += "?offset=$lastPos";
    }
    return await HttpClient.getList<Channel>(
        channelConverterInstance, path);
  }
}
