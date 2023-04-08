import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:taskgithub/presention/data/model/repomodel.dart';
import 'package:taskgithub/presention/home_page/viewmodel/cubit.dart';
import 'package:taskgithub/presention/home_page/viewmodel/state.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*default */
  late ScrollController statelessControllerA =
      ScrollController(initialScrollOffset: 0.0);

  @override
  void initState() {
    super.initState();
    // loadNextPage() ;

    statelessControllerA.addListener(() {
      setState(() {
        if(statelessControllerA.offset==statelessControllerA.position.maxScrollExtent){
          CubitApp.get(context).loadNextPage(context);
          print("current page ${CubitApp.get(context).page}");
        }
      });
    });
  }
  final _controller = StreamController<SwipeRefreshState>.broadcast();
  Stream<SwipeRefreshState> get _stream => _controller.stream;
  Future<void> _refresh() async {
    _controller.sink.add(SwipeRefreshState.hidden);
    CubitApp.get(context).page = 0;
    CubitApp.get(context).model.clear();
    CubitApp.get(context).loadNextPage(context);
    print(CubitApp.get(context).page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<CubitApp, StateApp>(
          listener: (context, state) {},
          builder: (context, state) {
            return SwipeRefresh.builder(
              itemCount: CubitApp.get(context).model.length ?? 0,
              itemBuilder: (context, index) => buildItem(CubitApp.get(context).model[index],context),
              stateStream: _stream,
              onRefresh: _refresh,
              scrollController: statelessControllerA,
              padding: const EdgeInsets.symmetric(vertical: 10),
            );
          },
        ));
  }
}

Widget buildItem(RepoModel model,BuildContext context) => InkWell(
      onLongPress: ()
      {
        showDialog(context: context, builder: (context)=> AlertDialog(
          title:TextButton(onPressed: ()
          {
            openUrl(url: "${model.repoUrl}");
          },child: Text("open Repo Url"),),
          content: TextButton(onPressed: ()
          {
            openUrl(url: "${model.owner!.ownerGitHub}");
          },child: Text("open Owner Url"),),
        ));
      },
      child: Card(
        color: model.fork == true ? Colors.green : Colors.white,
        margin: EdgeInsetsDirectional.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "${model.repoName}",
              style: TextStyle(fontSize: 20),
            ),
            Text("${model.repoName}"),
            Text("${model.description}"),
          ]),
        ),
      ),
    );
void openUrl({
 required String url
})async {
  if (await canLaunchUrl(Uri.parse(url)))
  await launchUrl(Uri.parse(url));
}
