import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../Exception/app_exception.dart';
import '../../../../Model/Type/user_id.dart';
import '../../../../Repository/AuthRepository/auth_repository.dart';
import '../../../../Repository/AuthRepository/auth_repository_impl.dart';

import 'base_authenticated_usecase.dart';

part 'base_authenticated_usecase_impl.g.dart';

@Riverpod(keepAlive: true)
BaseAuthenticatedUsecase baseAuthenticatedUsecase(
  BaseAuthenticatedUsecaseRef ref,
) {
  final authRepository = ref.watch(authRepositoryProvider);
  return BaseAuthenticatedUsecaseImpl(authRepository: authRepository);
}

class BaseAuthenticatedUsecaseImpl implements BaseAuthenticatedUsecase {
  const BaseAuthenticatedUsecaseImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;
  @override
  UserId getCurrentUserId() {
    final user = _authRepository.getCurrentUser();
    if (user == null) {
      throw const AppException.auth(AuthErrorType.userNotFound);
    }
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
