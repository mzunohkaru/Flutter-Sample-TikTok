// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get commentId => throw _privateConstructorUsedError;
  String get postOwnerUid => throw _privateConstructorUsedError;
  String get commentText => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get commentOwnerUid => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createAt => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String commentId,
      String postOwnerUid,
      String commentText,
      String postId,
      String commentOwnerUid,
      @TimestampConverter() Timestamp createAt,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? postOwnerUid = null,
    Object? commentText = null,
    Object? postId = null,
    Object? commentOwnerUid = null,
    Object? createAt = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      postOwnerUid: null == postOwnerUid
          ? _value.postOwnerUid
          : postOwnerUid // ignore: cast_nullable_to_non_nullable
              as String,
      commentText: null == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      commentOwnerUid: null == commentOwnerUid
          ? _value.commentOwnerUid
          : commentOwnerUid // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String commentId,
      String postOwnerUid,
      String commentText,
      String postId,
      String commentOwnerUid,
      @TimestampConverter() Timestamp createAt,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? postOwnerUid = null,
    Object? commentText = null,
    Object? postId = null,
    Object? commentOwnerUid = null,
    Object? createAt = null,
    Object? user = freezed,
  }) {
    return _then(_$CommentImpl(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      postOwnerUid: null == postOwnerUid
          ? _value.postOwnerUid
          : postOwnerUid // ignore: cast_nullable_to_non_nullable
              as String,
      commentText: null == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      commentOwnerUid: null == commentOwnerUid
          ? _value.commentOwnerUid
          : commentOwnerUid // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.commentId,
      required this.postOwnerUid,
      required this.commentText,
      required this.postId,
      required this.commentOwnerUid,
      @TimestampConverter() required this.createAt,
      required this.user});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String commentId;
  @override
  final String postOwnerUid;
  @override
  final String commentText;
  @override
  final String postId;
  @override
  final String commentOwnerUid;
  @override
  @TimestampConverter()
  final Timestamp createAt;
  @override
  final User? user;

  @override
  String toString() {
    return 'Comment(commentId: $commentId, postOwnerUid: $postOwnerUid, commentText: $commentText, postId: $postId, commentOwnerUid: $commentOwnerUid, createAt: $createAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.postOwnerUid, postOwnerUid) ||
                other.postOwnerUid == postOwnerUid) &&
            (identical(other.commentText, commentText) ||
                other.commentText == commentText) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.commentOwnerUid, commentOwnerUid) ||
                other.commentOwnerUid == commentOwnerUid) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commentId, postOwnerUid,
      commentText, postId, commentOwnerUid, createAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String commentId,
      required final String postOwnerUid,
      required final String commentText,
      required final String postId,
      required final String commentOwnerUid,
      @TimestampConverter() required final Timestamp createAt,
      required final User? user}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get commentId;
  @override
  String get postOwnerUid;
  @override
  String get commentText;
  @override
  String get postId;
  @override
  String get commentOwnerUid;
  @override
  @TimestampConverter()
  Timestamp get createAt;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
