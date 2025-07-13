///
sealed class Failure implements Exception {
  ///
  Failure([this.message]);

  /// errr message
  String? message;

  ///
  @override
  String toString() {
    final message = this.message;
    if (message == null) return 'fatal error';
    return 'Exception: $message';
  }
}

///
class NoInternetFailure extends Failure {
  ///
  NoInternetFailure([
    String super.message = 'No or poor internet connection.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class BadRequestFailure extends Failure {
  ///
  BadRequestFailure([
    String super.message = 'We are unable to process your request.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class UnauthorizedFailure extends Failure {
  ///
  UnauthorizedFailure([
    String super.message = 'You are not authorized to make this request.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class RefreshTokenFailure extends Failure {
  ///
  RefreshTokenFailure([
    String super.message = 'Refreshing jwt token failed.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class ForbiddenFailure extends Failure {
  ///
  ForbiddenFailure([
    String super.message =
        'You have insufficient permissions to fulfil this request.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class NotFoundFailure extends Failure {
  ///
  NotFoundFailure([
    String super.message = 'The requested information could not be found.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class InternalServerErrorFailure extends Failure {
  ///
  InternalServerErrorFailure([
    String super.message = 'Fatal server error occurred.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class ConflictFailure extends Failure {
  ///
  ConflictFailure([
    String super.message = 'This information already exist within the system..',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class NotImplementedFailure extends Failure {
  ///
  NotImplementedFailure([
    String super.message = 'Unimplemented resource.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class BadGatewayFailure extends Failure {
  ///
  BadGatewayFailure([
    String super.message = 'Bad Gateway..',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class MethodNotAllowedFailure extends Failure {
  ///
  MethodNotAllowedFailure([
    String super.message = 'Method not allowed.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class UnprocessableEntityFailure extends Failure {
  ///
  UnprocessableEntityFailure([
    String super.message = 'Unprocessable entity.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class TooManyRequestFailure extends Failure {
  ///
  TooManyRequestFailure([
    String super.message = 'You have made too many request.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class UnknownFailure extends Failure {
  ///
  UnknownFailure([
    String super.message = 'An unknown error from the server.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class TimeoutFailure extends Failure {
  ///
  TimeoutFailure([
    String super.message = 'Connection to server timed out.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class DbErrorFailure extends Failure {
  ///
  DbErrorFailure([
    String super.message = 'An error occurred while handling cache.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class GoogleSignInCanceledFailure extends Failure {
  ///
  GoogleSignInCanceledFailure([
    String super.message = 'You canceled the sign in process.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class MissingAuthCodeFailure extends Failure {
  ///
  MissingAuthCodeFailure([
    String super.message = 'Missing auth code.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class MissingIDTokenFailure extends Failure {
  ///
  MissingIDTokenFailure([
    String super.message = 'Missing id token.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class CancelledImagePickerFailure extends Failure {
  ///
  CancelledImagePickerFailure([
    String super.message = 'You cancelled the interactive image picker.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class CancelledCameraFailure extends Failure {
  ///
  CancelledCameraFailure([
    String super.message = 'You dismissed the camera.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class FatalCameraFailure extends Failure {
  ///
  FatalCameraFailure([
    String super.message = 'Fatal error occurred while taking a photo.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class FatalImagePickerFailure extends Failure {
  ///
  FatalImagePickerFailure([
    String super.message = 'Fatal error occurred while selecting an image.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}

///
class MaxImageLimitImagePickerFailure extends Failure {
  ///
  MaxImageLimitImagePickerFailure([
    String super.message =
        'The maximum number of pictures allowed for upload is limited to five.',
  ]);

  ///
  @override
  String toString() {
    return message ?? '';
  }
}
