part of profilerh_common;

class Company {
  String id;
  String name;
  String nafCode;
  String email;
  Map<String, String> phones;
  List<String> countries;
  int nbEmployees;
  List<String> departments;
  List<Address> address;
  Map<String, String> socialNetworkLinks;
  String url;
  // TODO : Create mutuelle schema

  Company();
  Company.from({
               this.name,
               this.nafCode,
               this.email,
               this.phones,
               this.countries,
               this.nbEmployees,
               this.departments,
               this.address,
               this.socialNetworkLinks,
               this.url
               });
}

Company createNewCompanyDemo() {
  Company c = new Company();

  c.name = "ProfileRH";
  c.nafCode = "6546546546";
  c.email = "contact@profilerh.com";
  c.phones = {"fix": "0156987442"};
  c.countries = ["France"];
  c.nbEmployees = 4+3;
  c.departments = ["Direction", "Development"];
  c.address = [createNewDemoAddress()];
  c.socialNetworkLinks = {"facebook": "https://facebook.com/profilerh", "twitter": "https://twitter.com/profilerh"};
  c.url = "http://profilerh.com";

  return c;
}