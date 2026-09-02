import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_state.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/network/services/network_service.dart';

class CardsRemoteDataSource {
  final NetworkService _networkService;

  CardsRemoteDataSource(this._networkService);

  Future<ApiResponse<List<TemplateCategoriesModel>>>
      getTemplateCategories() async {
    try {
      final response = await _networkService.get(
        EndPoints.templatesCategories,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                TemplateCategoriesModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<List<InvitationTemplateModel>>> getTemplates(
      String category, List<FilterSearchModel>? filters) async {
    try {
      final response = await _networkService.get(
        EndPoints.templates,
        queryParameters: {
          'category': category,
          if (filters != null)
            'filters': jsonEncode(
              filters.map((filter) {
                return {
                  'filter_label': filter.filter_label,
                  'option_value': filter.option_value,
                };
              }).toList(),
            )
        },
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                InvitationTemplateModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<List<TemplateFieldModel>>> getFields(
      String templateName) async {
    try {
      final body = FormData.fromMap({
        'template_name': templateName,
      });

      log(body.fields.toString());
      final response =
          await _networkService.get(EndPoints.getFields, data: body);

      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                TemplateFieldModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<String>> previewCard(
      String templateName, List<Map<String, dynamic>> filters) async {
    try {
      final response = await _networkService.post(
        EndPoints.getPreviewCard,
        data: {
          'template_name': templateName,
          'field_values': jsonEncode(filters
              .map((filter) => {
                    'field_name': filter.keys.first,
                    'value': filter.values.first,
                  })
              .toList()),
        },
        queryParameters: {},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request failed');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => (json as Map<String, dynamic>)['preview_image'] as String,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<ConfirmPreviewCardResponse>> confirmPreviewCard(
      String templateName, List<Map<String, dynamic>> filters) async {
    try {
      final response = await _networkService.post(
        EndPoints.confirmPreviewCard,
        data: {
          'template_name': templateName,
          'field_values': jsonEncode(filters
              .map((filter) => {
                    'field_name': filter.keys.first,
                    'value': filter.values.first,
                  })
              .toList()),
        },
        queryParameters: {},
      );

      if (response.data == null || response.statusCode > 201) {
        if ((response.data['exception'] as String).contains('balance')) {
          throw Exception('balance');
        }
        throw Exception('Request failed');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) =>
            ConfirmPreviewCardResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }
}
