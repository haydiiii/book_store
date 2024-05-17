abstract class ApiConsumer {
  Future<dynamic>? get(String path,
      {Map<String, dynamic>? query, Object? data,
      });

 Future<dynamic>? post(String path, {Map<String, dynamic>? query, Object? data});
 Future<dynamic>? patch(String path, {Map<String, dynamic>? query, Object? data});
 Future<dynamic>? delete(String path, {Map<String, dynamic>? query, Object? data});
}
