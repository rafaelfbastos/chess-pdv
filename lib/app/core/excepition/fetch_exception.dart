class FetchException implements Exception {
  final String? message;

  FetchException({required this.message});

  @override
  String toString() {
    return message??'Error de conexão';
  }

}