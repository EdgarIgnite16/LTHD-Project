class OfficesInfo {
  final String? name;
  final List<int>? officialIndices;

  OfficesInfo({this.name, this.officialIndices});

  static OfficesInfo fromJson(Map<String, dynamic> json) {
    return OfficesInfo(
        name: json["name"] as String?,
        officialIndices: json["officialIndices"].cast<int>());
  }
}
