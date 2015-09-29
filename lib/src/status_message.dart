part of profilerh_common;

class StatusCode {
  static final ACCESS_DENIED = new StatusCode._(0);
  static final ACCESS_GRANTED = new StatusCode._(1);
  static final WRONG_PASSWORD = new StatusCode._(2);
  static final WRONG_USERNAME = new StatusCode._(3);
  static final BAD_CREDENTIALS = new StatusCode._(4);
  static final INVALID_ARGUMENT = new StatusCode._(5);
  static final INTERNAL_ERROR = new StatusCode._(6);
  static final FILE_NOT_FOUND = new StatusCode._(7);
  static final FILE_SAVE = new StatusCode._(8);
  static final FILE_NOT_SAVE = new StatusCode._(9);
  static final CONNECTED = new StatusCode._(10);
  static final UNKNOWN = new StatusCode._(42);
  static final SUCCESS = new StatusCode._(43);

  static get values => [
    ACCESS_DENIED,
    ACCESS_GRANTED,
    WRONG_PASSWORD,
    WRONG_USERNAME,
    BAD_CREDENTIALS,
    INVALID_ARGUMENT,
    INTERNAL_ERROR,
    FILE_NOT_FOUND,
    FILE_SAVE,
    FILE_NOT_SAVE,
    CONNECTED,
    UNKNOWN,
    SUCCESS
  ];

  int value;

  StatusCode._(this.value);
  StatusCode();
}

class StatusMessage {
  StatusCode code;
  bool valid;
  String name;
  String message;
  Map<String, String> info = {};

  StatusMessage();
  StatusMessage.from({
    this.code,
    this.valid,
    this.name,
    this.message,
    this.info
  }) {
    if (info == null) this.info = {};
  }
}