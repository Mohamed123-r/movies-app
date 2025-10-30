abstract class ApiConsumer {
  Future<dynamic> get(String path);

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? data,
    bool formData = false,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? data,
    bool formData = false,
  });

  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? data,
    bool formData = false,
  });

  Future<dynamic> delete(String path);
}
