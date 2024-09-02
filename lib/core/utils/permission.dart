// Custom exceptions for better error handling
class LocationServiceDisabledException implements Exception {
  final String message;
  LocationServiceDisabledException(this.message);
  @override
  String toString() => 'LocationServiceDisabledException: $message';
}

class PermissionDeniedException implements Exception {
  final String message;
  PermissionDeniedException(this.message);
  @override
  String toString() => 'PermissionDeniedException: $message';
}
