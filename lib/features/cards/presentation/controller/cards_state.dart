import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';

class CardsState {
  final String selectedFiltre;
  final AsyncValue<List<TemplateCategoriesModel>> categories;
  final AsyncValue<List<InvitationTemplateModel>> templates;

  final List<Filter> filters;
  final List<Map<String, String>> selectedOptions;
  final List<Map<String, dynamic>> fieldsValues;
  final AsyncValue<List<TemplateFieldModel>> templateFields;
  final AsyncValue<String> previewCardUrl;
  final AsyncValue<ConfirmPreviewCardResponse>? confirmPreviewCardResponse;

  CardsState(
      {required this.selectedFiltre,
      required this.categories,
      required this.templates,
       this.confirmPreviewCardResponse,
      required this.filters,
      required this.selectedOptions,
      required this.fieldsValues,
      required this.templateFields,
      required this.previewCardUrl});

  factory CardsState.initial() {
    return CardsState(
        selectedFiltre: 'All',
        categories: AsyncLoading(),
        templates: AsyncLoading(),
        filters: [],
        selectedOptions: [],
        fieldsValues: [],
        templateFields: AsyncLoading(),
        previewCardUrl: AsyncLoading());
  }

  CardsState copyWith(
      {String? selectedFiltre,
      AsyncValue<List<TemplateCategoriesModel>>? categories,
      AsyncValue<List<InvitationTemplateModel>>? templates,
      List<Filter>? filters,
      List<Map<String, String>>? selectedOptions,
      AsyncValue<ConfirmPreviewCardResponse>? confirmPreviewCardResponse,
      List<Map<String, dynamic>>? fieldsValues,
      AsyncValue<List<TemplateFieldModel>>? templateFields,
      AsyncValue<String>? previewCardUrl}) {
    return CardsState(
      selectedFiltre: selectedFiltre ?? this.selectedFiltre,
      categories: categories ?? this.categories,
      templates: templates ?? this.templates,
      filters: filters ?? this.filters,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      fieldsValues: fieldsValues ?? this.fieldsValues,
      templateFields: templateFields ?? this.templateFields,
      confirmPreviewCardResponse:
          confirmPreviewCardResponse ?? this.confirmPreviewCardResponse,
      previewCardUrl: previewCardUrl ?? this.previewCardUrl,
    );
  }
}

class FilterSearchModel {
  final String filter_label;
  final String option_value;

  FilterSearchModel({required this.filter_label, required this.option_value});

  Map<String, String> toJson() {
    return {
      'filter_label': filter_label,
      'option_value': option_value,
    };
  }
}
