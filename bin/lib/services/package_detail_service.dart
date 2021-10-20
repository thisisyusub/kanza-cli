import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/package_detail.dart';

class PackageDetailService {
  final String _pubBaseUrl = 'https://pub.dev/api/';
  static PackageDetailService? _packageDetailService;
  static http.Client? client;

  PackageDetailService._createInstance();

  factory PackageDetailService() {
    if (_packageDetailService == null) {
      _packageDetailService = PackageDetailService._createInstance();
      client = http.Client();
    }
    return _packageDetailService!;
  }

  Future<PackageDetail?> getPackageDetail(String packageName) async {
    try {
      http.Response response = await client!.get(
        Uri.parse('${_pubBaseUrl}packages/$packageName'),
      );

      PackageDetail model = PackageDetail.fromJson(
        json.decode(utf8.decode(response.bodyBytes)),
      );

      return model;
    } catch (e) {
      stderr.write(e);
      return null;
    }
  }
}
