import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String? _token;  // Menyimpan token untuk digunakan pada setiap request

  // Constructor yang menerima token
  ApiService({String? token}) 
      : _dio = Dio(BaseOptions(baseUrl: "https://equran.id/api/v2/")),
        _token = token;

  // Menambahkan token ke header setiap request
  void _setTokenHeader() {
    if (_token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_token';
    }
  }

  // Handle GET request dengan token
  Future<Response> getRequest(String endpoint) async {
    try {
      _setTokenHeader();  // Menambahkan token ke header sebelum melakukan request
      Response response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Handle POST request dengan token
  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      _setTokenHeader();  // Menambahkan token ke header sebelum melakukan request
      Response response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Handle PUT request dengan token
  Future<Response> putRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      _setTokenHeader();  // Menambahkan token ke header sebelum melakukan request
      Response response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Optional: Custom error handling
  void _handleError(DioException error) {
    if (error.response != null) {
      print('Error: ${error.response?.data}');
    } else {
      print('Error: ${error.message}');
    }
  }
}