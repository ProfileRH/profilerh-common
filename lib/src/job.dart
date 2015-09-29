part of profilerh_common;

/**
 * Enum tricks from before 1.8 to allow json transformation
 */
class JobCategory {
  static final CADRE = new MaritalStatus._(0);
  static final DIRECTOR = new MaritalStatus._(1);
  static final EMPLOYEE = new MaritalStatus._(2);

  static get values => [CADRE, DIRECTOR, EMPLOYEE];

  int value;

  JobCategory._(this.value);
  JobCategory();
}


/**
 * Enum tricks from before 1.8 to allow json transformation
 */
class JobContract {
  static final CDD = new JobContract._(0);
  static final CDI = new JobContract._(1);
  static final INTERNSHIP = new JobContract._(2);

  static get values => [CDD, CDI, INTERNSHIP];

  int value;

  JobContract._(this.value);
  JobContract();
}

/**
 * Enum tricks from before 1.8 to allow json transformation
 */
class JobEventType {
  static final DAY_OFF = new JobEventType._(0);
  static final DISEASE = new JobEventType._(1);
  static final EXTRA_TIME = new JobEventType._(2);
  static final MISSION = new JobEventType._(3);
  static final RTT = new JobEventType._(4);
  static final OTHER = new JobEventType._(5);


  static get values => [DAY_OFF, DISEASE, EXTRA_TIME, MISSION, RTT, OTHER];

  int value;

  JobEventType._(this.value);
  JobEventType();
}

class JobEvent {
  JobEventType type;
  DateTime start;
  DateTime end;

  JobEvent();
  JobEvent.from({
    this.type,
    this.start,
    this.end
  });
}

class Activity {
  int dayOffDue;
  int dayOffTaken;
  int rttDue;
  int rttTaken;
  int overTime;
  double accountExpense;
  List<JobEvent> events;

  Activity();
  Activity.from({
    this.dayOffDue,
    this.dayOffTaken,
    this.rttDue,
    this.overTime,
    this.accountExpense,
    this.events
  });
}

class JobContactInformation {
  String officePhone;
  String mail;
  String localisation;

  JobContactInformation();
  JobContactInformation.from({
    this.officePhone,
    this.mail,
    this.localisation
  });
}

class Job {
  String id;
  String companyId;
  String timeSheetId;
  String refundId;
  String userId;

  JobContactInformation contactInformation;
  JobCategory category;
  JobContract contractType;
  DateTime startDate;
  String jobTitle;
  String businessUnit;

  double annualWage;
  double hourlyCoefficient;
  Activity activity;

  List<String> managers;

  Job();
  Job.from({
    this.id,
    this.companyId,
    this.timeSheetId,
    this.refundId,
    this.userId,
    this.contactInformation,
    this.category,
    this.contractType,
    this.startDate,
    this.jobTitle,
    this.businessUnit,
    this.annualWage,
    this.hourlyCoefficient,
    this.activity,
    this.managers
});
}

Job createNewJobDemo(Company c, User u, [List<Job> managers]) {
  Job j = new Job();

  j.companyId = c.id;
  j.timeSheetId = "";
  j.refundId = "";
  j.userId = u.id;
  j.contactInformation = new JobContactInformation.from(officePhone: '0156203997', mail: "${u.lastName}.${u.firstName}@${c.name}.com", localisation: "1er Etage, bureau C");
  j.category = JobCategory.EMPLOYEE;
  j.contractType = JobContract.CDI;
  j.startDate = new DateTime.now();
  j.jobTitle = "Ingenieur";
  j.businessUnit = c.departments[0];
  j.annualWage = 40000.0;
  j.hourlyCoefficient = 30.0;
  j.activity = new Activity.from(dayOffDue: 25, dayOffTaken: 5, rttDue: 14, overTime: 10, accountExpense: 123.5, events: [new JobEvent.from(type: JobEventType.DAY_OFF, start: new DateTime.now(), end: new DateTime.now().add(new Duration(hours: 3)))]);
  j.managers = [];
  if (managers != null)
    for (var id in managers) {
      j.managers.add(id.id);
    }

  return j;
}