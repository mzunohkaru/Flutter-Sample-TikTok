// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppException {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppExceptionCopyWith<AppException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res, AppException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res, $Val extends AppException>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message!
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkImpl extends _Network {
  const _$NetworkImpl({this.message = 'ネットワークエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      __$$NetworkImplCopyWithImpl<_$NetworkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network extends AppException {
  const factory _Network({final String message}) = _$NetworkImpl;
  const _Network._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl({this.message = 'リソースが見つかりません'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends AppException {
  const factory _NotFound({final String message}) = _$NotFoundImpl;
  const _NotFound._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl extends _Unauthorized {
  const _$UnauthorizedImpl({this.message = '認証されていません'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized extends AppException {
  const factory _Unauthorized({final String message}) = _$UnauthorizedImpl;
  const _Unauthorized._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownImpl extends _Unknown {
  const _$UnknownImpl({this.message = '不明なエラーが発生しました'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown extends AppException {
  const factory _Unknown({final String message}) = _$UnknownImpl;
  const _Unknown._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirebaseImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$FirebaseImplCopyWith(
          _$FirebaseImpl value, $Res Function(_$FirebaseImpl) then) =
      __$$FirebaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FirebaseException firebaseException, String message});
}

/// @nodoc
class __$$FirebaseImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$FirebaseImpl>
    implements _$$FirebaseImplCopyWith<$Res> {
  __$$FirebaseImplCopyWithImpl(
      _$FirebaseImpl _value, $Res Function(_$FirebaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseException = null,
    Object? message = null,
  }) {
    return _then(_$FirebaseImpl(
      null == firebaseException
          ? _value.firebaseException
          : firebaseException // ignore: cast_nullable_to_non_nullable
              as FirebaseException,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FirebaseImpl extends _Firebase {
  const _$FirebaseImpl(this.firebaseException, {this.message = 'サーバーの発生しました'})
      : super._();

  @override
  final FirebaseException firebaseException;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppException.firebase(firebaseException: $firebaseException, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseImpl &&
            (identical(other.firebaseException, firebaseException) ||
                other.firebaseException == firebaseException) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firebaseException, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseImplCopyWith<_$FirebaseImpl> get copyWith =>
      __$$FirebaseImplCopyWithImpl<_$FirebaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return firebase(firebaseException, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return firebase?.call(firebaseException, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(firebaseException, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return firebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return firebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(this);
    }
    return orElse();
  }
}

abstract class _Firebase extends AppException {
  const factory _Firebase(final FirebaseException firebaseException,
      {final String message}) = _$FirebaseImpl;
  const _Firebase._() : super._();

  FirebaseException get firebaseException;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseImplCopyWith<_$FirebaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserErrorType type, String? message});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_$UserImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserErrorType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserImpl extends _User {
  const _$UserImpl(this.type, {this.message}) : super._();

  @override
  final UserErrorType type;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.user(type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return user(type, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return user?.call(type, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(type, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }
}

abstract class _User extends AppException {
  const factory _User(final UserErrorType type, {final String? message}) =
      _$UserImpl;
  const _User._() : super._();

  UserErrorType get type;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl value, $Res Function(_$AuthImpl) then) =
      __$$AuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthErrorType type, String? message});
}

/// @nodoc
class __$$AuthImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$AuthImpl>
    implements _$$AuthImplCopyWith<$Res> {
  __$$AuthImplCopyWithImpl(_$AuthImpl _value, $Res Function(_$AuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_$AuthImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthErrorType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthImpl extends _Auth {
  const _$AuthImpl(this.type, {this.message}) : super._();

  @override
  final AuthErrorType type;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.auth(type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      __$$AuthImplCopyWithImpl<_$AuthImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return auth(type, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return auth?.call(type, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(type, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class _Auth extends AppException {
  const factory _Auth(final AuthErrorType type, {final String? message}) =
      _$AuthImpl;
  const _Auth._() : super._();

  AuthErrorType get type;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLikesImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UserLikesImplCopyWith(
          _$UserLikesImpl value, $Res Function(_$UserLikesImpl) then) =
      __$$UserLikesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserLikesErrorType type, String? message});
}

/// @nodoc
class __$$UserLikesImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UserLikesImpl>
    implements _$$UserLikesImplCopyWith<$Res> {
  __$$UserLikesImplCopyWithImpl(
      _$UserLikesImpl _value, $Res Function(_$UserLikesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_$UserLikesImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserLikesErrorType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserLikesImpl extends _UserLikes {
  const _$UserLikesImpl(this.type, {this.message}) : super._();

  @override
  final UserLikesErrorType type;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.userLikes(type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLikesImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLikesImplCopyWith<_$UserLikesImpl> get copyWith =>
      __$$UserLikesImplCopyWithImpl<_$UserLikesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return userLikes(type, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return userLikes?.call(type, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (userLikes != null) {
      return userLikes(type, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return userLikes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return userLikes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (userLikes != null) {
      return userLikes(this);
    }
    return orElse();
  }
}

abstract class _UserLikes extends AppException {
  const factory _UserLikes(final UserLikesErrorType type,
      {final String? message}) = _$UserLikesImpl;
  const _UserLikes._() : super._();

  UserLikesErrorType get type;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$UserLikesImplCopyWith<_$UserLikesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserSavesImplCopyWith<$Res>
    implements $AppExceptionCopyWith<$Res> {
  factory _$$UserSavesImplCopyWith(
          _$UserSavesImpl value, $Res Function(_$UserSavesImpl) then) =
      __$$UserSavesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserSavesErrorType type, String? message});
}

/// @nodoc
class __$$UserSavesImplCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res, _$UserSavesImpl>
    implements _$$UserSavesImplCopyWith<$Res> {
  __$$UserSavesImplCopyWithImpl(
      _$UserSavesImpl _value, $Res Function(_$UserSavesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_$UserSavesImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserSavesErrorType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserSavesImpl extends _UserSaves {
  const _$UserSavesImpl(this.type, {this.message}) : super._();

  @override
  final UserSavesErrorType type;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppException.userSaves(type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSavesImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSavesImplCopyWith<_$UserSavesImpl> get copyWith =>
      __$$UserSavesImplCopyWithImpl<_$UserSavesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) notFound,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) unknown,
    required TResult Function(
            FirebaseException firebaseException, String message)
        firebase,
    required TResult Function(UserErrorType type, String? message) user,
    required TResult Function(AuthErrorType type, String? message) auth,
    required TResult Function(UserLikesErrorType type, String? message)
        userLikes,
    required TResult Function(UserSavesErrorType type, String? message)
        userSaves,
  }) {
    return userSaves(type, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? unknown,
    TResult? Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult? Function(UserErrorType type, String? message)? user,
    TResult? Function(AuthErrorType type, String? message)? auth,
    TResult? Function(UserLikesErrorType type, String? message)? userLikes,
    TResult? Function(UserSavesErrorType type, String? message)? userSaves,
  }) {
    return userSaves?.call(type, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? notFound,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? unknown,
    TResult Function(FirebaseException firebaseException, String message)?
        firebase,
    TResult Function(UserErrorType type, String? message)? user,
    TResult Function(AuthErrorType type, String? message)? auth,
    TResult Function(UserLikesErrorType type, String? message)? userLikes,
    TResult Function(UserSavesErrorType type, String? message)? userSaves,
    required TResult orElse(),
  }) {
    if (userSaves != null) {
      return userSaves(type, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_Firebase value) firebase,
    required TResult Function(_User value) user,
    required TResult Function(_Auth value) auth,
    required TResult Function(_UserLikes value) userLikes,
    required TResult Function(_UserSaves value) userSaves,
  }) {
    return userSaves(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Network value)? network,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_Firebase value)? firebase,
    TResult? Function(_User value)? user,
    TResult? Function(_Auth value)? auth,
    TResult? Function(_UserLikes value)? userLikes,
    TResult? Function(_UserSaves value)? userSaves,
  }) {
    return userSaves?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_Firebase value)? firebase,
    TResult Function(_User value)? user,
    TResult Function(_Auth value)? auth,
    TResult Function(_UserLikes value)? userLikes,
    TResult Function(_UserSaves value)? userSaves,
    required TResult orElse(),
  }) {
    if (userSaves != null) {
      return userSaves(this);
    }
    return orElse();
  }
}

abstract class _UserSaves extends AppException {
  const factory _UserSaves(final UserSavesErrorType type,
      {final String? message}) = _$UserSavesImpl;
  const _UserSaves._() : super._();

  UserSavesErrorType get type;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$UserSavesImplCopyWith<_$UserSavesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
