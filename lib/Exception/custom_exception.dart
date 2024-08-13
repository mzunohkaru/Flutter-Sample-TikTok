import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_exception.freezed.dart';

@freezed
class CustomException with _$CustomException implements Exception {
  const factory CustomException({
    @Default('エラーが発生しました') String? message,
  }) = _CustomException;
}
