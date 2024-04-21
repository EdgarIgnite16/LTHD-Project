class OfficialsInfo {
  final String? name;
  final List<Map<String, dynamic>>? address;
  final String? party;
  final List<String>? phones;
  final List<String>? emails;
  final List<String>? urls;
  final String? photoUrl;
  final List<Map<String, dynamic>>? channels;

  OfficialsInfo({
    this.name,
    this.address,
    this.party,
    this.phones,
    this.emails,
    this.urls,
    this.photoUrl,
    this.channels,
  });

  static OfficialsInfo fromJson(Map<String, dynamic> json) {
    return OfficialsInfo(
      name: json['name'] as String?,
      address: json['address']?.cast<Map<String, dynamic>>(),
      party: json['party'] as String?,
      phones: json['phones']?.cast<String>(),
      emails: json['emails']?.cast<String>(),
      urls: json['urls']?.cast<String>(),
      photoUrl: json['photoUrl'] as String?,
      channels: json['channels']?.cast<Map<String, dynamic>>(),
    );
  }
}
