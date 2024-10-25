class CalculateException implements Exception {
  final String message;
  CalculateException(this.message);
}

class GetCurrencyException implements Exception {
  final String message;
  GetCurrencyException(this.message);
}

class PrintingException implements Exception {
  final String message;
  PrintingException(this.message);
}

class ClientInfoException implements Exception {
  final String message;
  ClientInfoException(this.message);
}
