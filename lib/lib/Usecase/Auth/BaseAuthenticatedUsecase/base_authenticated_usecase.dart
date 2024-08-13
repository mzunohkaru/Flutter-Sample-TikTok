import '../../../../Model/Type/user_id.dart';

abstract class BaseAuthenticatedUsecase {
  UserId getCurrentUserId();
  Future<void> signOut();
}
