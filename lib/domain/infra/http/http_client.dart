abstract class HttpClient {
  Future<dynamic> request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> body = const {},
  });
}

enum RequestMethod {
  get,
  put,
  post,
  patch,
  delete,
}
