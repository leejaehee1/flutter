import 'package:plms_start/screens/models/model_system.dart';

class SystemList {
  final List<System> system;

  SystemList({required this.system});

  factory SystemList.fromJson(List<dynamic> json) {
    List<System> system = <System>[];
    system = json.map((i) => System.fromJson(i)).toList();

    return new SystemList(system: system);
  }
}
