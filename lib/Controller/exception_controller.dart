

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}



class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Something went wrong: ");
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class InvalidOtp extends CustomException {
  InvalidOtp([message]) : super(message, "Something went wrong: ");
}