import 'dart:async';

import 'package:kroot_app/features/cards/presentation/controller/cards_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'cards_controller.g.dart';
@riverpod
class CardsController extends _$CardsController {
  @override
  FutureOr<CardsState> build() {
    return CardsState.initial();
  }

  void changeFilterType(String type) {
    state = AsyncData(state.value!.copyWith(selectedFiltre: type));
  }
}