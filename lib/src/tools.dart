part of profilerh_common;

String generateSalt() {
  var uuid = new Uuid();
  String s = uuid.v4();

  s = s.replaceAll("-", "");

  return s;
}

String hashPassword(String password) {
  var sha = new cipher.SHA3Digest(224);
  var lPassword = new List.from(password.codeUnits);

  var l = sha.process(new Uint8List.fromList(lPassword));
  var s = "";
  l.forEach((i) => s += i.toRadixString(16));
  return s;
}

generateHashPassword(String salt, String password) {
  var sha = new cipher.SHA3Digest(224);
  var lSalt = new List.from(salt.codeUnits);
  var lPassword = password.codeUnits;

  lSalt.addAll(lPassword);
  var l = sha.process(new Uint8List.fromList(lSalt));
  var s = "";
  l.forEach((i) => s += i.toRadixString(16));
  return s;
}


Map insertParamInMap(var obj, String param, var newValue){
  print("Trying to change ${param} by ${newValue}");
  Map map;
  if (obj is Map)
    map = obj;
  else
    map = obj.toJson();
  List<String>  tokenList = param.split('.');
  map.forEach((key, value){
    print("Looking for ${key}");
    if (key.toString() == tokenList[0]) {
      print("String match");
      if (value is Map) {
        print("Not a string");
        map[key] = insertParamInMap(value, param.substring(param.indexOf('.') + 1), newValue);
      }
      else {
        map[key] = newValue;
        return map;
      }
    }
  });
  return map;
}