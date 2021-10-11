import 'package:holodex_impl_project/entity/channel.dart';
import 'package:holodex_impl_project/service/channel_service.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final channelListController = RM
    .injectFuture<ChannelListController>(() => ChannelListController().init());

class ChannelListController {
  late List<Channel> channelList;

  int get length => channelList.length;
  String get lastId => channelList.last.id;

  Future<ChannelListController> init() async {
    channelList = await channelServiceInstance.getChannelList();
    return this;
  }

  void updateList() async {
    List<Channel> list = await channelServiceInstance.getChannelList(lastPos: length);
    if(list.isNotEmpty) {
      channelList.addAll(list);
    }
  }
}
