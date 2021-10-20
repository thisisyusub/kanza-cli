class PackageDetail {
  late String name;
  late Latest latest;

  PackageDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latest = Latest.fromJson(json['latest']);
  }
}

class Latest {
  late String version;

  Latest.fromJson(Map<String, dynamic> json) {
    version = json['version'];
  }
}
