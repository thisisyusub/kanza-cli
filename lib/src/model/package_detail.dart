class PackageDetail {
  late String name;
  late Latest latest;

  PackageDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latest = Latest.fromJson(json['latest']);
  }

  @override
  String toString() {
    return '$name: ${latest.version}';
  }
}

class Latest {
  late String version;

  Latest.fromJson(Map<String, dynamic> json) {
    version = json['version'];
  }

  @override
  String toString() {
    return version;
  }
}
