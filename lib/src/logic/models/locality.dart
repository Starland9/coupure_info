class Locality {
  final String quarter;
  final String city;
  final String observations;
  final DateTime startDate;
  final DateTime endDate;

  const Locality({
    required this.quarter,
    required this.city,
    required this.observations,
    required this.startDate,
    required this.endDate,
  });

  factory Locality.fromJson(Map<String, dynamic> json) {
    return Locality(
      quarter: json['quater'],
      city: json['city'],
      observations: json['observations'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }
}
