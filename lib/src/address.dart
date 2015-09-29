part of profilerh_common;

class Address {
  int streetNumber;
  String street;
  String city;
  String zipCode;
  String country;
  String additionalInfo;

  Address();
  Address.from({this.streetNumber, this.street, this.city, this.zipCode, this.country, this.additionalInfo});
}

Address createNewDemoAddress() {
  var a = new Address.from(streetNumber: 42, street: "republique", city: "Paris", zipCode: "75000", additionalInfo: "Aucune");
  return a;
}