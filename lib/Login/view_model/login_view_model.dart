
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/Login/serivce/login_service.dart';

import '../model/login_user_model.dart';

class LoginViewModel extends StateNotifier<String>{
  final ApiService apiService;
  LoginViewModel(this.apiService) : super("");

  Future<void> submitUser(LoginUser user) async {
    try {
      final result = await apiService.createUser(user);
      state = result;

    } catch (e) {
      state = e.toString();
    }
  }
}