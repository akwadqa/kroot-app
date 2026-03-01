import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottm_navigation_bar_provider.g.dart';
@riverpod
class BottomNavIndex extends _$BottomNavIndex {
  @override
  int build() => 0;

  void setIndex(int newIndex) => state = newIndex;
}
