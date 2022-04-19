class StatusCode {
  static const int SUCCESS = 1;

  static const int OK = 200;
  static const int BAD_REQUEST = 400;
  static const int SERVER_ERROR = 500;

  static isBadRequest(int statusCode) =>
      statusCode >= BAD_REQUEST && statusCode < SERVER_ERROR;

  static isServerError(int statusCode) => statusCode >= SERVER_ERROR;
}

class ResponseAttrs {
  static const String SUCCESS = "success";
  static const String MESSAGE = "message";
  static const String DATA = "data";
}
