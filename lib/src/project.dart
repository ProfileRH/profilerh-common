part of profilerh_common;

class Project {
  List<String> ownerId;
  List<String> participantId;
  String name;
  DateTime start;
  DateTime end;

  Project();
  Project.from({
    this.ownerId,
    this.participantId,
    this.name,
    this.start,
    this.end
  });
}

Project createNewProjectDemo(List<String> owner, List<String> participant, String name) {
  var project = new Project();
  project.ownerId = owner;
  project.participantId = participant;
  project.name = name;
  project.start = new DateTime.now();

  return project;
}