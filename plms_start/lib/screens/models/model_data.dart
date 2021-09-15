import 'dart:convert';

List<System> systemFromJson(String str) =>
    List<System>.from(json.decode(str).map((x) => System.fromJson(x)));

String systemToJson(List<System> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class System {
  System({
    required this.systemId,
    required this.systemName,
  });

  String systemId;
  String systemName;

  factory System.fromJson(Map<String, dynamic> json) => System(
        systemId: json["systemID"],
        systemName: json["systemName"],
      );

  Map<String, dynamic> toJson() => {
        "systemID": systemId,
        "systemName": systemName,
      };
}

List<Subsystem> subsystemFromJson(String str) =>
    List<Subsystem>.from(json.decode(str).map((x) => Subsystem.fromJson(x)));

String subsystemToJson(List<Subsystem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subsystem {
  Subsystem({
    required this.subsystem,
    required this.subsystemName,
  });

  String subsystem;
  String subsystemName;

  factory Subsystem.fromJson(Map<String, dynamic> json) => Subsystem(
        subsystem: json["subsystem"],
        subsystemName: json["subsystemName"],
      );

  Map<String, dynamic> toJson() => {
        "subsystem": subsystem,
        "subsystemName": subsystemName,
      };
}
