abstract base class DomainError implements Exception {
  final String message;
  DomainError([this.message = ""]);
}
