import 'package:flutter/material.dart';

class CardsState {
  final String selectedFiltre;

  CardsState({required this.selectedFiltre});

  factory CardsState.initial() {
    return CardsState(selectedFiltre: 'All');
  }

   CardsState copyWith({String? selectedFiltre}) {
    return CardsState(
      selectedFiltre: selectedFiltre ?? this.selectedFiltre,
    );
  }
}
