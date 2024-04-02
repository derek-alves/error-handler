import 'package:dio/dio.dart';
import 'package:error_handler/error_handler.dart';

import '../../domain/infra/http/http.dart';

class DioAdapter implements HttpClient {
  final Dio client;

  DioAdapter(this.client);
  @override
  Future request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParameters = const {},
  }) async {
    Response response = Response(
      data: '',
      statusCode: 500,
      requestOptions: RequestOptions(
        path: url,
      ),
    );
    return response;
    late final Future<Response>? futureResponse;
    try {
      futureResponse = _getResssponse(
        method: method,
        url: url,
        queryParameters: queryParameters,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        body: body,
      );
      response = await futureResponse.timeout(const Duration(seconds: 10));
    } catch (e) {
      throw ServerErrorHttp();
    }
    return _handleResponse(response);
  }

  Future<Response<dynamic>> _getResssponse({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) {
    switch (method) {
      case RequestMethod.get:
        return client.get(url,
            queryParameters: queryParameters, options: options);
      case RequestMethod.put:
        return client.put(url, data: body, options: options);
      case RequestMethod.post:
        return client.post(url, data: body, options: options);
      case RequestMethod.patch:
        return client.patch(url, data: body, options: options);
      case RequestMethod.delete:
        return client.delete(url,
            queryParameters: queryParameters, options: options);
      default:
        return client.get(url,
            queryParameters: queryParameters, options: options);
    }
  }

  dynamic _handleResponse(Response response) {
    final message = (response.data['message'] ?? '').toString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data.isEmpty ? {} : response.data as Map<String, dynamic>;
    } else if (response.statusCode == 204) {
      return {};
    } else if (response.statusCode == 400) {
      throw BadRequestHttp(message);
    } else if (response.statusCode == 401) {
      throw UnauthorizedHttp(message);
    } else if (response.statusCode == 403) {
      throw ForbiddenHttp(message);
    } else if (response.statusCode == 404) {
      throw NotFoundHttp(message);
    } else if (response.statusCode == 422) {
      throw InvalidDataHttp(message);
    } else {
      throw ServerErrorHttp();
    }
  }
}
