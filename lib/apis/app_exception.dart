class AppException implements Exception {
  const AppException({
    required this.message,
    required this.prefix,
  });

  final String? message;
  final String? prefix;

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message: message, prefix: 'Error During Communication: ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message: message, prefix: 'Invalid Request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message: message, prefix: 'Unauthorised Request: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message: message, prefix: 'Invalid Input: ');
}
