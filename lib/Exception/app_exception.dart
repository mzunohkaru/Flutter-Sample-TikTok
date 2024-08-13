import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const AppException._();
  const factory AppException.network({
    @Default('ネットワークエラーが発生しました') String message,
  }) = _Network;

  const factory AppException.notFound({
    @Default('リソースが見つかりません') String message,
  }) = _NotFound;

  const factory AppException.unauthorized({
    @Default('認証されていません') String message,
  }) = _Unauthorized;

  const factory AppException.unknown({
    @Default('不明なエラーが発生しました') String message,
  }) = _Unknown;

  const factory AppException.firebase(
    FirebaseException firebaseException, {
    @Default('サーバーの発生しました') String message,
  }) = _Firebase;

  const factory AppException.user(
    UserErrorType type, {
    String? message,
  }) = _User;

  const factory AppException.auth(
    AuthErrorType type, {
    String? message,
  }) = _Auth;

  const factory AppException.userLikes(
    UserLikesErrorType type, {
    String? message,
  }) = _UserLikes;

  const factory AppException.userSaves(
    UserSavesErrorType type, {
    String? message,
  }) = _UserSaves;

  // Custom getter for error message
  String get errorMessage => when(
        network: (message) => message,
        notFound: (message) => message,
        unauthorized: (message) => message,
        unknown: (message) => message,
        firebase: (_, message) => message,
        auth: (type, message) => message ?? _getAuthErrorMessage(type),
        user: (type, message) => message ?? _getUserErrorMessage(type),
        userLikes: (type, message) =>
            message ?? _getUserLikesErrorMessage(type),
        userSaves: (type, message) =>
            message ?? _getUserSavesErrorMessage(type),
      );

  // Helper methods for getting default messages
  String _getAuthErrorMessage(AuthErrorType type) {
    switch (type) {
      case AuthErrorType.invalidCredentials:
        return '無効な認証情報です';
      case AuthErrorType.userNotFound:
        return 'ユーザーが見つかりません';
      case AuthErrorType.weakPassword:
        return 'パスワードが脆弱です';
      case AuthErrorType.emailAlreadyInUse:
        return 'このメールアドレスは既に使用されています';
    }
  }

  String _getUserErrorMessage(UserErrorType type) {
    switch (type) {
      case UserErrorType.userNotFound:
        return 'ユーザーが見つかりません';
      case UserErrorType.invalidUserData:
        return '無効なユーザーデータです';
      case UserErrorType.notUniqueID:
        return 'ユーザーIDが一意でありません';
    }
  }

  String _getUserLikesErrorMessage(UserLikesErrorType type) {
    switch (type) {
      case UserLikesErrorType.userLikesFailed:
        return 'ユーザーのいいねに失敗しました';
      case UserLikesErrorType.userLikesNotFound:
        return 'ユーザーのいいねが見つかりません';
      case UserLikesErrorType.unknown:
        return '不明なエラーが発生しました';
    }
  }

  String _getUserSavesErrorMessage(UserSavesErrorType type) {
    switch (type) {
      case UserSavesErrorType.userSavesFailed:
        return 'ユーザーの保存に失敗しました';
      case UserSavesErrorType.userSavesNotFound:
        return 'ユーザーの保存が見つかりません';
      case UserSavesErrorType.unknown:
        return '不明なエラーが発生しました';
    }
  }
}

// Enum definitions remain the same
enum UserErrorType {
  userNotFound,
  invalidUserData,
  notUniqueID,
}

enum AuthErrorType {
  invalidCredentials,
  userNotFound,
  weakPassword,
  emailAlreadyInUse
}

enum UserLikesErrorType {
  userLikesFailed,
  userLikesNotFound,
  unknown,
}

enum UserSavesErrorType {
  userSavesFailed,
  userSavesNotFound,
  unknown,
}
