part of profilerh_common;


/**
 * Enum tricks from before 1.8 to allow json transformation
 */
class Gender {
  static final MAN = new Gender._(0);
  static final WOMAN = new Gender._(1);

  static get values => [MAN, WOMAN];

  int value;

  Gender._(this.value);
  Gender();
}


/**
 * Enum tricks from before 1.8 to allow json transformation
 */
class MaritalStatus {
  static final DIVORCED = new MaritalStatus._(0);
  static final MARRIED = new MaritalStatus._(1);
  static final SINGLE = new MaritalStatus._(2);

  static get values => [DIVORCED, MARRIED, SINGLE];

  int value;

  MaritalStatus._(this.value);
  MaritalStatus();
}

/**
 * Enum tricks from before 1.8 to allow json transformation
 */
class ChildStatus {
  static final SCHOOL = new ChildStatus._(0);
  static final STUDENT = new ChildStatus._(1);
  static final BABY = new ChildStatus._(2);
  static final NONE = new ChildStatus._(2);


  static get values => [SCHOOL, STUDENT, BABY, NONE];

  int value;

  ChildStatus._(this.value);
  ChildStatus();
}

class Bank {
  String name;
  String address;
  String iban;

  Bank();
  Bank.from({this.name, this.address, this.iban});
}

class Child {
  int age;
  DateTime birthDate;
  ChildStatus status;

  Child();
  Child.from({this.age, this.birthDate, this.status});
}

class Family {
  MaritalStatus maritalStatus;
  List<Child> children;

  Family();
  Family.from({this.children, this.maritalStatus});
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  Family familyStatus;
  String socialSecurity;
  Address address;
  Gender gender;

  User();
  User.from({this.id, this.firstName, this.lastName, this.email, this.phoneNumber, this.familyStatus, this.socialSecurity, this.address, this.gender});
}

User createNewDemoUser({String firstname : "user", String lastname: "resu"}) {
  User u = new User.from(firstName: firstname, lastName: lastname);
  u.email = "${firstname}.${lastname}@fakecompany.com";
  u.phoneNumber = "0659986760";
  u.familyStatus = new Family.from(children: [new Child.from(age: 12, birthDate: new DateTime.now(), status: ChildStatus.SCHOOL)], maritalStatus: MaritalStatus.MARRIED);
  u.socialSecurity = "65464654564";
  u.address = createNewDemoAddress();
  u.gender = Gender.MAN;

  return u;
}