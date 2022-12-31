import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    // こちらの場合FutureBuilder等が必要
    @Default('') String sample,
  }) = _HomeState;
}
