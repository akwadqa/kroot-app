import 'package:kroot_app/features/cards/data/data%20source/cards_remote_data_source.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_state.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/exception/dio_exceptions.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_repository.g.dart';

@Riverpod(keepAlive: true)
CardsRepository cardsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return CardsRepository(CardsRemoteDataSource(networkService));
}
class CardsRepository {
  final CardsRemoteDataSource _cardsRemoteDataSource;

  CardsRepository(this._cardsRemoteDataSource);

  Future<ApiResponse<List<TemplateCategoriesModel>>> getTemplateCategories() async {
    final response = await _cardsRemoteDataSource.getTemplateCategories();
  
    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }
  Future<ApiResponse<List<InvitationTemplateModel>>> getTemplates(
      String category, List<FilterSearchModel>? filters) async {
    final response = await _cardsRemoteDataSource.getTemplates(category, filters);

    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }
  Future<ApiResponse<List<TemplateFieldModel>>> getFields(
      String templateName) async {
    final response = await _cardsRemoteDataSource.getFields(templateName);

    if (response.status == 200) {
      return response;
    }

    throw AppException(response.message);
  }
}