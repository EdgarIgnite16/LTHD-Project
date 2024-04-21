class AreaInfo {
  final String? city;
  final String? state;
  final String? zip;

  AreaInfo({
    required this.city,
    required this.state,
    required this.zip,
  });

  static AreaInfo fromJson(Map<String, dynamic> json) {
    return AreaInfo(city: json["city"] as String?, state: json["state"] as String?, zip: json["zip"] as String?);
  }
}
