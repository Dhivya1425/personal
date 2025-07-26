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
    bool? isLoading,
    List<User>? userList,
    List<Post>? postList,
    List<Comment>? commentList,
    int? decrementCount,
    int? count,
    bool? isClicked,
    String? error,
  }) {
    return DashBoardState(
        isLoading: isLoading ?? this.isLoading,
        userList: userList ?? this.userList,
        commentList: commentList ?? this.commentList,
        postList: postList ?? this.postList,
        decrementCount: decrementCount ?? this.decrementCount,
        count: count ?? this.count,
        isClicked: isClicked ?? this.isClicked,
        error: error ?? this.error);
  }
}
