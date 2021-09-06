class PunchModel {
  final String? punchID;
  final String? category;
  final String? status;
  final String? discipline;
  final String? unit;
  final String? area;
  final String? system;

  PunchModel(
    this.punchID,
    this.category,
    this.status,
    this.discipline,
    this.unit,
    this.area,
    this.system,
  );

  @override
  String toString() {
    return '{ ${this.punchID}, ${this.category},${this.status},${this.discipline},${this.unit},${this.area},${this.system}, }';
  }

  // factory PunchModel.fromJson(Map<String, dynamic> parsedJson) {
  //   return PunchModel(
  //     punchID: parsedJson['punchID'],
  //     category: parsedJson['category'],
  //     status: parsedJson['status'],
  //     discipline: parsedJson['discipline'],
  //     unit: parsedJson['unit'],
  //     area: parsedJson['area'],
  //     system: parsedJson['system'],
  //   );
  // }
}
