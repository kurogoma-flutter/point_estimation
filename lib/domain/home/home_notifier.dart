import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layer_architecture_template/domain/home/home_service.dart';
import 'package:layer_architecture_template/domain/home/home_state.dart';

final homeNotifierProvider =
    StateNotifierProvider.autoDispose<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(
    homeService: ref.read(homeService),
  );
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.homeService,
  }) : super(const HomeState());

  final HomeService homeService;

  // Future<void> init() async {
  //   // 通常のFutureのサンプル
  //   final homeList = await homeService.fetchHomeModelList();
  //   state = state.copyWith(
  //     homeList: homeList,
  //   );

  //   // AsyncValueのサンプル
  //   final futureHomeModelList = await homeService.fetchHomeModelList();
  //   state =
  //       state.copyWith(futureHomeList: AsyncValue.data(futureHomeModelList));
  // }
}
