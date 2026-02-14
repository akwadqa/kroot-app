import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kroot_app/features/app/app_service.dart';
import 'package:kroot_app/features/app/data/repository/app_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';
@Riverpod(keepAlive: true)
class AppController extends _$AppController {
  @override
  Future<void>? build() async {
    return;
  }

  Future<void> checkAppVersion() async {
    // state = const AsyncLoading();


    try {
      final appRepository = ref.watch(appDataRepositoryProvider);

      final result = await appRepository.getAppVersion();
     await ref.read(appServiceProvider.notifier).checkAppVersion(result.data!);
      // final slom = await ref
      //     .read(serviceTypesControllerProvider.notifier)
      //     .getServiceTypes(context);
      // state = AsyncData(currentState);
      
    } catch (e) {
      debugPrint("❌ Error checkAppVersion: $e");
      state = AsyncError(e, StackTrace.current);
    }
  }


}