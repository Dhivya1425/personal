

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/Login/serivce/login_service.dart';

import '../view_model/login_view_model.dart';

final loginProvider = Provider<ApiService>((ref) => ApiService());

final loginUserViewModelProvider =
StateNotifierProvider<LoginViewModel, String>(
      (ref) => LoginViewModel(ref.read(loginProvider)),
);
