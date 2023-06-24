class Launch {
  final DateTime launchDateLocal;
  final String missionName;
  final String siteName;
  final String siteNameLong;
  final String url;

  Launch({
    required this.launchDateLocal,
    required this.missionName,
    required this.siteName,
    required this.siteNameLong,
    required this.url,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      launchDateLocal: DateTime.parse(json["launch_date_local"]),
      missionName:
          json["mission_name"] as String? ?? """"Mission" name load error""",
      siteName: json["launch_site"]["site_name"] as String? ??
          """"Site name" name load error""",
      siteNameLong: json["launch_site"]["site_name_long"] as String? ??
          """"Site name long" name load error""",
      url: json['links']['wikipedia'] as String? ?? "Url not found",
    );
  }
}
