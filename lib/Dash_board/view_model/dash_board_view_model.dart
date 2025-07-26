import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/comment_model.dart';
import '../model/post_model.dart';
import '../model/user_nodel.dart';
import '../services/api_service.dart';
import '../state/dash_board_state.dart';


class DashBoardViewModel extends StateNotifier<DashBoardState> {
  final ApiService service;
  DashBoardViewModel(this.service) : super(DashBoardState());

  List<User> userList = [];
  List<Post> postList = [];
  List<Comment> commentList = [];

  setCount(){
   state.count = (state.count ?? 0) + 1;
   state = state.copywith(
       isLoading: false,
       userList: userList,
       postList: postList,
       commentList: commentList,
       count: state.count,
       decrementCount: state.decrementCount,
       isClicked: state.isClicked
   );
  }

  setDecrementCount(){
    state.decrementCount = (state.decrementCount ?? 0) - 1;
    state = state.copywith(
      isLoading: false,
      userList: userList,
      postList: postList,
      commentList: commentList,
      count: state.count,
      decrementCount: state.decrementCount,
      isClicked: state.isClicked
    );
  }

  setClick(){
    state.isClicked = !(state.isClicked ?? false);
    state = state.copywith(
        isLoading: false,
        userList: userList,
        postList: postList,
        commentList: commentList,
        count: state.count,
        decrementCount: state.decrementCount,
        isClicked: state.isClicked
    );
  }

  Future apiCall() async {
    state = state.copywith(isLoading: true);
    try {
      userList = await service.fetchUsers();
      postList = await service.fetchPosts();
      commentList = await service.fetchComments();
      state = state.copywith(
        isLoading: false,
        userList: userList,
        postList: postList,
        commentList: commentList,
        count: state.count,
        decrementCount:state.decrementCount
      );
    } catch (e) {
      state = state.copywith(isLoading: false,error: e.toString());
    }
  }
}
