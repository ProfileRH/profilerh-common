part of profilerh_common;

class Refund {
  DateTime date;
  String type;
  String additionalInformation;
  double amount;
}

class Refunds {
  String id;
  String userId;
  List<Refund> refunds;
}