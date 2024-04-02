import 'package:flutter_error_handling/domain/entity/entity.dart';

abstract class GetAccountUsecase {
  Future<AccountEntity?> get();
}
