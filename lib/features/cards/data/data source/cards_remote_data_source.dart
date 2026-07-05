import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_state.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
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
            'filters': filters
                .map((filter) => {
                      'filter_label': filter.filter_label,
                      'option_value': filter.option_value,
                    })
                .toList(),
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
}
