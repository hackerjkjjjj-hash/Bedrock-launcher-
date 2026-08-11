class VersionModel {
  final String version;
  final String buildNumber;
  final bool isSupported;
  final String releaseNotes;

  VersionModel({
    required this.version,
    required this.buildNumber,
    this.isSupported = true,
    this.releaseNotes = '',
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      version: json['version'] ?? '1.26.33',
      buildNumber: json['buildNumber'] ?? '100',
      isSupported: json['isSupported'] ?? true,
      releaseNotes: json['releaseNotes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'buildNumber': buildNumber,
      'isSupported': isSupported,
      'releaseNotes': releaseNotes,
    };
  }
}
