part of 'pagination.dart';

T _$identity<T>(T value) => value;

mixin _$Pagination {
  @JsonKey(name: 'total_items')
  int get totalItems;
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @JsonKey(name: 'current_page')
  int get currentPage;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Pagination> get copyWith =>
      _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pagination &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalItems, totalPages, currentPage);

  @override
  String toString() {
    return 'Pagination(totalItems: $totalItems, totalPages: $totalPages, currentPage: $currentPage)';
  }
}

abstract mixin class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
    Pagination value,
    $Res Function(Pagination) _then,
  ) = _$PaginationCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'total_items') int totalItems,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'current_page') int currentPage,
  });
}

class _$PaginationCopyWithImpl<$Res> implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(
      _self.copyWith(
        totalItems: null == totalItems ? _self.totalItems : totalItems as int,
        totalPages: null == totalPages ? _self.totalPages : totalPages as int,
        currentPage: null == currentPage
            ? _self.currentPage
            : currentPage as int,
      ),
    );
  }
}

extension PaginationPatterns on Pagination {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Pagination value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Pagination value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Pagination value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'total_items') int totalItems,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'current_page') int currentPage,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
        return $default(_that.totalItems, _that.totalPages, _that.currentPage);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'total_items') int totalItems,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'current_page') int currentPage,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination():
        return $default(_that.totalItems, _that.totalPages, _that.currentPage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'total_items') int totalItems,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'current_page') int currentPage,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
        return $default(_that.totalItems, _that.totalPages, _that.currentPage);
      case _:
        return null;
    }
  }
}

@JsonSerializable()
class _Pagination implements Pagination {
  const _Pagination({
    @JsonKey(name: 'total_items') required this.totalItems,
    @JsonKey(name: 'total_pages') required this.totalPages,
    @JsonKey(name: 'current_page') required this.currentPage,
  });
  factory _Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  @override
  @JsonKey(name: 'total_items')
  final int totalItems;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationCopyWith<_Pagination> get copyWith =>
      __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pagination &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalItems, totalPages, currentPage);

  @override
  String toString() {
    return 'Pagination(totalItems: $totalItems, totalPages: $totalPages, currentPage: $currentPage)';
  }
}

abstract mixin class _$PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(
    _Pagination value,
    $Res Function(_Pagination) _then,
  ) = __$PaginationCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_items') int totalItems,
    @JsonKey(name: 'total_pages') int totalPages,
    @JsonKey(name: 'current_page') int currentPage,
  });
}

class __$PaginationCopyWithImpl<$Res> implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalItems = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(
      _Pagination(
        totalItems: null == totalItems ? _self.totalItems : totalItems as int,
        totalPages: null == totalPages ? _self.totalPages : totalPages as int,
        currentPage: null == currentPage
            ? _self.currentPage
            : currentPage as int,
      ),
    );
  }
}
