import 'package:flutter/material.dart';
import 'package:holodex_impl_project/controller/channel_list_controller.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RM.navigate.navigatorKey,
      title: 'Holodex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ReactiveStatelessWidget {
  final ScrollController sc = ScrollController();
  ScrollPosition? beforeUpdate;

  MyHomePage({Key? key}) : super(key: key);

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (sc.position.extentAfter == 0) {
        beforeUpdate = sc.position;
        channelListController.setState(
          (s) => s.updateList(),
          onRebuildState: () => sc.jumpTo(beforeUpdate!.maxScrollExtent)
        );
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Holodex'),
      ),
      body: Builder(
        builder: (context) {
          if (channelListController.isWaiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (channelListController.hasError) {
            return Text(channelListController.error.toString());
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                channelListController.setState((s) => s.updateList());
              },
              child: NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: ListView.builder(
                  controller: sc,
                  itemCount: channelListController.state.length + 1,
                  itemBuilder: (context, index) {
                    if (index == channelListController.state.length) {
                      return const SizedBox(
                        height: 75,
                        child: Center(child: Text("Pull to load more"),),
                      );
                    } else {
                      final channel =
                        channelListController.state.channelList[index];
                        return Card(
                          child: ListTile(
                            leading: Text(channel.org),
                            title: Text(channel.name),
                            subtitle: Text(channel.englishName),
                          ),
                        );
                    }
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
