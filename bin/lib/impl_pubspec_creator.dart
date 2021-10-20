import 'constants/constants_data.dart';
import 'i_creators.dart';
import 'model/package_detail.dart';
import 'services/package_detail_service.dart';

class ImplPubspecCreator implements IPubspecCreator {
  @override
  Future<void> getPackageVersion() async {
    for (String package in kPubPackageList) {
      PackageDetail? data = await PackageDetailService().getPackageDetail(
        packageName: package,
      );

      if (data != null) {
        print(data.toString());
      }
    }
  }
}
