import '../../constants/constants_data.dart';
import '../../services/package_detail_service.dart';
import '../../model/package_detail.dart';
import '../i_creators.dart';

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
  }
}
