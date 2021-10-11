import 'package:dio/dio.dart';
import 'package:holodex_impl_project/util/abstract_converter.dart';

class HttpClient {
  static const env = "prod";
  static final client = Dio(options);
  static final options = BaseOptions(
      baseUrl: env == "dev"
          ? "https://stoplight.io/mocks/holodex/holodex/11620234"
          : "https://holodex.net/api/v2");

  static Future<T> getSingle<T>(AbstractConverter<T> converter, String path,
      {Map<String, dynamic>? queryParameters}) async {
    Response response;
    if (queryParameters != null) {
      response = await client.get(path, queryParameters: queryParameters);
    } else {
      response = await client.get(path);
    }
    return converter.fromJson(response.data);
  }

  static Future<List<T>> getList<T>(AbstractConverter<T> converter, String path,
      {Map<String, dynamic>? queryParameters}) async {
    Response response;
    if (queryParameters != null) {
      response = await client.get(path, queryParameters: queryParameters);
    } else {
      response = await client.get(path);
    }
    return converter.fromJsonList(response.data);
  }
}
