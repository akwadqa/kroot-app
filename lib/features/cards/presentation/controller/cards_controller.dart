import 'dart:async';
import 'dart:developer';

import 'package:kroot_app/features/cards/data/repository/cards_repository.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_controller.g.dart';

@Riverpod(keepAlive: true)
class CardsController extends _$CardsController {
  @override
  Future<CardsState> build() async {
    final templates = await getTemplateCategories();
    return CardsState.initial()
        .copyWith(categories: AsyncData(templates ?? []));
  }

  Future<List<TemplateCategoriesModel>?> getTemplateCategories() async {
    try {
      if (state.value == null) state = AsyncData(CardsState.initial());
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

  Future<String?> previewCard(String templateName) async {
    try {
      state = AsyncData(state.value!.copyWith(previewCardUrl: AsyncLoading()));
      final repo = ref.read(cardsRepositoryProvider);
      final filters = state.value!.fieldsValues;
      final response = await repo.previewCard(templateName, filters);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            previewCardUrl: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!.copyWith(previewCardUrl: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(previewCardUrl: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<ConfirmPreviewCardResponse?> confirmPreviewCard(
      String templateName) async {
    try {
      state = AsyncData(
          state.value!.copyWith(confirmPreviewCardResponse: AsyncLoading()));
      final repo = ref.read(cardsRepositoryProvider);
      final filters = state.value!.fieldsValues;
      final response = await repo.confirmPreviewCard(templateName, filters);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            confirmPreviewCardResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!
            .copyWith(confirmPreviewCardResponse: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(confirmPreviewCardResponse: AsyncError(e, st)),
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
      final response = await repo.getTemplates(category,
          filters.where((filter) => filter.option_value != '').toList());

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

  void setIsCards(bool isCards) {
    state = AsyncData(state.value!.copyWith(isCards: isCards));
  }

  void changeFilterValue(String value) {
    state = AsyncData(state.value!.copyWith(filerValue: value));
    ref.read(homeControllerProvider.notifier).refreshEvents();
  }

  void removeFieldValue({required String fieldName}) {
    final fieldsValues =
        List<Map<String, String>>.from(state.value!.fieldsValues);
    fieldsValues.removeWhere((field) => field.keys.first == fieldName);

    state = AsyncData(state.value!.copyWith(fieldsValues: fieldsValues));
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
