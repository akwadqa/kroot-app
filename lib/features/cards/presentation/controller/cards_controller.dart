import 'dart:async';
import 'dart:developer';

import 'package:kroot_app/features/cards/data/repository/cards_repository.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_state.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_controller.g.dart';

@riverpod
class CardsController extends _$CardsController {
  @override
  FutureOr<CardsState> build() {
    return CardsState.initial();
  }

  Future<List<TemplateCategoriesModel>?> getTemplateCategories() async {
    try {
      state = AsyncData(state.value!.copyWith(categories: AsyncLoading()));
      final repo = ref.read(cardsRepositoryProvider);
      final response = await repo.getTemplateCategories();

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            categories: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!.copyWith(categories: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(categories: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<List<TemplateFieldModel>?> getFields(String templateName) async {
    try {
      state = AsyncData(state.value!.copyWith(templateFields: AsyncLoading()));
      final repo = ref.read(cardsRepositoryProvider);
      final response = await repo.getFields(templateName);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            templateFields: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!.copyWith(templateFields: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(templateFields: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<List<InvitationTemplateModel>?> getTemplates(String category) async {
    try {
      state = AsyncData(state.value!.copyWith(templates: AsyncLoading()));
      final repo = ref.read(cardsRepositoryProvider);
      final filters = state.value!.selectedOptions.map((filter) {
        if (filter.values.first == 'All') {
          return FilterSearchModel(
              filter_label: filter.keys.first, option_value: '');
        }
        return FilterSearchModel(
            filter_label: filter.keys.first, option_value: filter.values.first);
      }).toList();
      final response = await repo.getTemplates(category, filters);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            templates: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!.copyWith(templates: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(templates: AsyncError(e, st)),
      );
      return null;
    }
  }

  void selectOptionFromFilter(
      {required String filterName, required String optionName}) {
    final selectedOptions =
        List<Map<String, String>>.from(state.value!.selectedOptions);
    final existingOptionIndex =
        selectedOptions.indexWhere((filter) => filter.keys.first == filterName);

    if (existingOptionIndex != -1) {
      selectedOptions[existingOptionIndex] = {filterName: optionName};
    } else {
      selectedOptions.add({filterName: optionName});
    }

    state = AsyncData(state.value!.copyWith(selectedOptions: selectedOptions));

    // getTemplates(
    //     state.value!.selectedFiltre,
    //     state.value!.selectedOptions
    //         .map((filter) => FilterSearchModel(
    //             filter_label: filter.keys.first,
    //             option_value: filter.values.first))
    //         .toList());
  }

  void cleanFilters() {
    state = AsyncData(state.value!.copyWith(selectedOptions: []));
  }

  void clearFieldsValues() {
    state = AsyncData(state.value!.copyWith(fieldsValues: []));
  }

  void addFieldValue({required String fieldName, required dynamic fieldValue}) {
    final fieldsValues =
        List<Map<String, String>>.from(state.value!.fieldsValues);
    final existingFieldIndex =
        fieldsValues.indexWhere((field) => field.keys.first == fieldName);

    if (existingFieldIndex != -1) {
      fieldsValues[existingFieldIndex] = {fieldName: fieldValue};
    } else {
      fieldsValues.add({fieldName: fieldValue.toString()});
    }

    state = AsyncData(state.value!.copyWith(fieldsValues: fieldsValues));
    log(fieldsValues.toString());
  }
}
