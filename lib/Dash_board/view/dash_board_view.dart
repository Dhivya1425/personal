import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/dash_board_provider.dart';
import '../state/dash_board_state.dart';

class DashBoardView extends ConsumerStatefulWidget {
  const DashBoardView({super.key});

  @override
  ConsumerState<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends ConsumerState<DashBoardView> {
  DashBoardState? state;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashBoardViewModelProvider.notifier).apiCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(dashBoardViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DashBoard",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: state?.isLoading == true
          ? Center(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [CircularProgressIndicator()]),
          )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 14.0, right: 14, bottom: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(dashBoardViewModelProvider.notifier)
                                .setCount();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.greenAccent.shade100,
                              child: Center(
                                  child: Text("${state?.count ?? "0"}"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(dashBoardViewModelProvider.notifier)
                                .setClick();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.deepPurple.shade100,
                              child: Center(
                                  child: Text(state?.isClicked == true
                                      ? "True"
                                      : 'False'))),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(dashBoardViewModelProvider.notifier)
                                .setDecrementCount();
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.cyan.shade100,
                              child: Center(
                                  child:
                                      Text("${state?.decrementCount ?? "0"}"))),
                        ),
                      ],
                    ),
                    Text(
                      "Users Lists",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.w500),
                    ),
                    ...buildUser(),
                    Text(
                      "Post Lists",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.w500),
                    ),
                    ...buildPost(),
                    Text(
                      "Comment Lists",
                      style: TextStyle(
                          color: Colors.indigoAccent,
                          fontWeight: FontWeight.w500),
                    ),

                    ...buildUser()
                  ],
                ),
              ),
            ),
    );
  }

  buildUser() {
    List<Widget> list = [];
    for (var i = 0; i < (state?.userList ?? []).length; i++) {
      list.add(Row(
        children: [
          Text("${state?.userList?[i].id.toString()}.  "),
          Text("${state?.userList?[i].username.toString()}"),
        ],
      ));
    }
    return list;
  }

  buildPost() {
    List<Widget> list = [];
    for (var i = 0; i < (state?.postList ?? []).length; i++) {
      list.add(Row(
        children: [
          Text("${state?.postList?[i].id.toString()}.  "),
          Container(
              width: MediaQuery.of(context).size.width / 1.25,
              child: Text(
                "${state?.postList?[i].title.toString()}",
                style: TextStyle(overflow: TextOverflow.ellipsis),
              )),
        ],
      ));
    }
    return list;
  }

  buildComment() {
    List<Widget> list = [];
    for (var i = 0; i < (state?.commentList ?? []).length; i++) {
      list.add(Row(
        children: [
          Text("${state?.commentList?[i].id.toString()}.  "),
          Text("${state?.commentList?[i].email.toString()}"),
        ],
      ));
    }
    return list;
  }
}
