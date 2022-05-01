import 'package:flutter_provider/models/home_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homePageNotifierProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>((ref) {
  return HomePageNotifier();
});

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier() : super(const HomePageState());

  // final Reader _read;

  void increaseMainCount() {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  void increaseSubCount() {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  void decreaseMainCount() {
    state = state.copyWith(mainCount: state.mainCount - 1);
  }

  void decreaseSubCount() {
    state = state.copyWith(subCount: state.subCount - 1);
  }

  void resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}
