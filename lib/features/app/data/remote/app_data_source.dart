import 'package:flutter/material.dart';
import 'package:kroot_app/features/app/domain/version_update.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/network/services/network_service.dart';

class AppDataSource {
  final NetworkService _networkService;

  AppDataSource(this._networkService);

  Future<ApiResponse<VersionUpdate>> getAppVersion() async {
    try {
      final response = await _networkService.get(
        EndPoints.getVersion,
        queryParameters: {},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Failed to load data');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => VersionUpdate.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      debugPrint('Error in getData: e');
      rethrow;
    }
  }
}
