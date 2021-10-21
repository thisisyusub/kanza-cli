import 'constants/constants_data.dart';
import 'i_creators.dart';
import 'model/package_detail.dart';
import 'services/package_detail_service.dart';
import 'dart:io';

class ImplPubspecCreator implements IPubspecCreator {
  @override
  Future<void> getPackageVersion() async {
    List<String> solvedPackageList = [];
    for (String package in kPubPackageList) {
      PackageDetail? data = await PackageDetailService().getPackageDetail(
        packageName: package,
      );

      if (data != null) {
        solvedPackageList.add(data.toString());
        print(data.toString());
      }
    }

    var bindir = Directory('bin').absolute.path;
    final file = await File('$bindir/test.dart').create();

    await file.writeAsString('ddd');

    print(await file.readAsString());
  }
}
