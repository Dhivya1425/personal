import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api_service.dart';
import '../state/dash_board_state.dart';
import '../view_model/dash_board_view_model.dart';

final apiProvider = Provider((ref) => ApiService());

final dashBoardViewModelProvider =
    StateNotifierProvider<DashBoardViewModel, DashBoardState>((ref) {
  final apiService = ref.read(apiProvider);
  return DashBoardViewModel(apiService);
});
