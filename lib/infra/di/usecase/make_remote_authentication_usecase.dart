import 'package:dio/dio.dart';
import 'package:flutter_error_handling/domain/usecases/usecases.dart';

import '../../../application/usecases/usecases.dart';
import '../../http/dio_adapter.dart';

AuthenticationUsecase makeRemoteAuthenticationUsecase() =>
    RemoteAuthenticationUsecase(url: 'any url', client: DioAdapter(Dio()));
