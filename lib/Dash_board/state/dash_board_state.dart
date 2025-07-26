
import '../model/comment_model.dart';
import '../model/post_model.dart';
import '../model/user_nodel.dart';

class DashBoardState {
  late bool isLoading;
  List<User>? userList;
  List<Post>? postList;
  List<Comment>? commentList;
  int? count = 0;
  int? decrementCount = 0;
  bool? isClicked;
  String? error;

  DashBoardState({
    this.isLoading = false,
    this.userList,
    this.postList,
    this.commentList,
    this.count,
    this.decrementCount,
    this.isClicked,
    this.error,
  });

  DashBoardState copywith({
    bool isLoading = false,
    List<User>? userList,
    List<Post>? postList,
    List<Comment>? commentList,
    int? decrementCount,
    int? count,
    bool? isClicked,
    String? error,
  }) {
    return DashBoardState(
        isLoading: isLoading,
        userList: userList,
        commentList: commentList,
        postList: postList,
        decrementCount: decrementCount,
        count: count,
        isClicked: isClicked,
        error: error);
  }
}
