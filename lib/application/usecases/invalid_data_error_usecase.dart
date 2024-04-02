import 'package:dio/dio.dart';
import 'package:error_handler/error_handler.dart';

import '../../domain/entity/entity.dart';
import '../../domain/infra/http/http.dart';
import '../../domain/usecases/usecases.dart';

class RemoteAuthenticationUsecase implements AuthenticationUsecase {
  final HttpClient client;
  final String url;

  RemoteAuthenticationUsecase({
    required this.client,
    required this.url,
  });

  @override
  Future<AccountEntity> auth(AuthenticationParams params) async {
    try {
      final Response data = await client.request(
        url: url,
        method: RequestMethod.post,
        body: params.toJson(),
      );
      await Future.delayed(const Duration(milliseconds: 300));
      // throw InvalidDataError();
      // if (data is! Map<String, dynamic>) throw InvalidDataError();
      // print(AccountEntity.new.runtimeType);
      return AccountEntity.fromJson(data.data);
    } on HttpError catch (e) {
      throw e.convertError(runtimeType);
    }
  }
}
