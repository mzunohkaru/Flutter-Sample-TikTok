// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get postId => throw _privateConstructorUsedError;
  String get ownerUid => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get postImageUrl => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  List<dynamic> get likeUsers => throw _privateConstructorUsedError;
  bool get didLike => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createAt => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String postId,
      String ownerUid,
      String caption,
      String postImageUrl,
      int likes,
      List<dynamic> likeUsers,
      bool didLike,
      @TimestampConverter() Timestamp createAt,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? ownerUid = null,
    Object? caption = null,
    Object? postImageUrl = null,
    Object? likes = null,
    Object? likeUsers = null,
    Object? didLike = null,
    Object? createAt = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUid: null == ownerUid
          ? _value.ownerUid
          : ownerUid // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      postImageUrl: null == postImageUrl
          ? _value.postImageUrl
          : postImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      likeUsers: null == likeUsers
          ? _value.likeUsers
          : likeUsers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      didLike: null == didLike
          ? _value.didLike
          : didLike // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      String ownerUid,
      String caption,
      String postImageUrl,
      int likes,
      List<dynamic> likeUsers,
      bool didLike,
      @TimestampConverter() Timestamp createAt,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? ownerUid = null,
    Object? caption = null,
    Object? postImageUrl = null,
    Object? likes = null,
    Object? likeUsers = null,
    Object? didLike = null,
    Object? createAt = null,
    Object? user = freezed,
  }) {
    return _then(_$PostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUid: null == ownerUid
          ? _value.ownerUid
          : ownerUid // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      postImageUrl: null == postImageUrl
          ? _value.postImageUrl
          : postImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      likeUsers: null == likeUsers
          ? _value._likeUsers
          : likeUsers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      didLike: null == didLike
          ? _value.didLike
          : didLike // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.postId,
      required this.ownerUid,
      required this.caption,
      required this.postImageUrl,
      required this.likes,
      required final List<dynamic> likeUsers,
      required this.didLike,
      @TimestampConverter() required this.createAt,
      required this.user})
      : _likeUsers = likeUsers;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String postId;
  @override
  final String ownerUid;
  @override
  final String caption;
  @override
  final String postImageUrl;
  @override
  final int likes;
  final List<dynamic> _likeUsers;
  @override
  List<dynamic> get likeUsers {
    if (_likeUsers is EqualUnmodifiableListView) return _likeUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeUsers);
  }

  @override
  final bool didLike;
  @override
  @TimestampConverter()
  final Timestamp createAt;
  @override
  final User? user;

  @override
  String toString() {
    return 'Post(postId: $postId, ownerUid: $ownerUid, caption: $caption, postImageUrl: $postImageUrl, likes: $likes, likeUsers: $likeUsers, didLike: $didLike, createAt: $createAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.ownerUid, ownerUid) ||
                other.ownerUid == ownerUid) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.postImageUrl, postImageUrl) ||
                other.postImageUrl == postImageUrl) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality()
                .equals(other._likeUsers, _likeUsers) &&
            (identical(other.didLike, didLike) || other.didLike == didLike) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      ownerUid,
      caption,
      postImageUrl,
      likes,
      const DeepCollectionEquality().hash(_likeUsers),
      didLike,
      createAt,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String postId,
      required final String ownerUid,
      required final String caption,
      required final String postImageUrl,
      required final int likes,
      required final List<dynamic> likeUsers,
      required final bool didLike,
      @TimestampConverter() required final Timestamp createAt,
      required final User? user}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get postId;
  @override
  String get ownerUid;
  @override
  String get caption;
  @override
  String get postImageUrl;
  @override
  int get likes;
  @override
  List<dynamic> get likeUsers;
  @override
  bool get didLike;
  @override
  @TimestampConverter()
  Timestamp get createAt;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
