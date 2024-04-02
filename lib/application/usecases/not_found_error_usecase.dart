import 'package:error_handler/application/base_error.dart';
import 'package:error_handler/error_handler.dart';

import '../../domain/entity/entity.dart';
import '../../domain/usecases/usecases.dart';

class NotFoundErrorUsecase implements AuthenticationUsecase {
//final HttpClient client;
  final String url;

  NotFoundErrorUsecase({
    // required this.client,
    required this.url,
  });

  @override
  Future<AccountEntity> auth(AuthenticationParams params) async {
    try {
      // final data = await client.request(
      //   url: url,
      //   method: RequestMethod.post,
      //   body: params.toJson(),
      // );
      await Future.delayed(const Duration(milliseconds: 300));
      throw NotFoundError();
      // if (data is! Map<String, dynamic>) throw InvalidDataError();
      // print(AccountEntity.new.runtimeType);
      // return AccountEntity.fromJson(data);
    } on HttpError catch (e) {
      throw e.convertError(e.runtimeType);
    }
  }
}
