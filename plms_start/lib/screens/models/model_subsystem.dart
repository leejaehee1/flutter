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
