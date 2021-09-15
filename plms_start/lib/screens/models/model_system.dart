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
