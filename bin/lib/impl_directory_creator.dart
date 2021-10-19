import 'dart:io';

import 'i_creators.dart';

class ImplDirectoryCreator implements IDirectoryCreator {
  final _core = 'core';
  final _bloc = 'bloc';
  final _data = 'data';
  final _ui = 'ui';
  final _utils = 'utils';

  late final String basePath;

  @override
  Directory get blocDir => Directory('$basePath/$_bloc');

  @override
  Directory get dataDir => Directory('$basePath/$_data');

  @override
  Directory get uiDir => Directory('$basePath/$_ui');

  @override
  Future<void> createDirectories() async {
    try {
      final libDir = Directory('lib');

      if (await libDir.exists()) {
        basePath = libDir.absolute.path;
      } else {
        final res = await Directory('lib').create(recursive: true);
        basePath = res.absolute.path;
      }

      final absBlocPath = blocDir.absolute.path;
      final absDataPath = dataDir.absolute.path;
      final absUiPath = uiDir.absolute.path;

      await Future.wait([
        // bloc directory
        Directory(absBlocPath).create(),
        Directory('$absBlocPath/$_core').create(),

        // data directory
        Directory(absDataPath).create(),
        Directory('$absDataPath/$_core').create(),
        Directory('$absDataPath/models').create(),
        Directory('$absDataPath/repositories').create(),
        Directory('$absDataPath/contractors').create(),
        Directory('$absDataPath/data_providers').create(),

        // ui directory
        Directory(absUiPath).create(),
        Directory('$absUiPath/pages').create(),
        Directory('$absUiPath/dialogs').create(),
        Directory('$absUiPath/$_core').create(),
        Directory('$absUiPath/global').create(),

        // utils directory
        Directory('$basePath/$_utils').create(),
      ]);
    } catch (e) {
      stderr.writeln(e);
      exit(2);
    }
  }
}
