// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  totalItems: (json['total_items'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'total_items': instance.totalItems,
      'total_pages': instance.totalPages,
      'current_page': instance.currentPage,
    };
