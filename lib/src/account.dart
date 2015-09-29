part of profilerh_common;

class AccountType {
  static final ROOT = new AccountType._(0);
  static final ADMIN = new AccountType._(1);
  static final COMPANY_ADMIN = new AccountType._(2);
  static final USER = new AccountType._(3);
  static final COMPANY_MANAGER = new AccountType._(4);
  static final CONNECTED = new AccountType._(41);
  static final ALL = new AccountType._(42);


  static get values => [ROOT, ADMIN, USER, COMPANY_ADMIN, COMPANY_MANAGER, CONNECTED, ALL];

  int value;

  AccountType._(this.value);
  AccountType();

  operator==(var v) {
    if (v is int) {
      return this.value == v;
    }
    return this == v;
  }
}

class AccountRight {
  String companyId;
  List<AccountType> roles;
}

class Account {
  String id;
  String userid;
  DateTime creationDate;
  DateTime lastModification;
  String salt;
  String hashedSaltPassword;
  String login;
  List<String> tokens;
  List<AccountRight> companyRights;
  List<AccountType> rights;
}

Account createNewAccountDemo(User u, Company c) {
  Account acc = new Account();
  acc.userid = u.id;
  acc.login = "${u.lastName}${u.firstName[0]}";
  acc.salt = generateSalt();
  acc.hashedSaltPassword = generateHashPassword(acc.salt, hashPassword("password"));
  acc.creationDate = new DateTime.now();
  acc.lastModification = new DateTime.now();
  var r = new AccountRight();
  r.companyId = c.id;
  r.roles = [AccountType.ADMIN, AccountType.USER, AccountType.COMPANY_MANAGER, AccountType.COMPANY_ADMIN];
  acc.rights = [AccountType.ADMIN, AccountType.USER];
  acc.companyRights = [r];
  acc.tokens = [];

  return acc;
}