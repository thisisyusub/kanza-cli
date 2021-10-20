import 'dart:io';

import 'lib/model/package_detail.dart';
import 'lib/services/package_detail_service.dart';
import 'lib/start.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  final argParser = ArgParser();
  argParser.addCommand('create');

  final res = argParser.parse(arguments);

  // final result = await Process.run(
  //   'flutter',
  //   ['pub', 'outdated'],
  //   workingDirectory: '.',
  //   runInShell: true,
  //   includeParentEnvironment: true,
  // );

  // print(result.stdout);
  // print(result.stderr);

  PackageDetail? data = await PackageDetailService().getPackageDetail('http');
  if (data != null) {
    print(data.latest.version);
  } else {
    print('null data');
  }

  if (res.command != null && res.command!.name == 'create') {
    start();
  } else {
    stderr.write('No command specified!');
    exit(1);
  }
}
