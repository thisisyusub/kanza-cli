import 'dart:io';

import '../i_creators.dart';

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
  Future<bool> createDirectories() async {
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

      print('creating directories...\n');

      // bloc directory
      print('creating bloc directory...');
      await Directory(absBlocPath).create();
      await Directory('$absBlocPath/$_core').create();

      // data directory
      print('creating data directory...');
      await Directory(absDataPath).create();
      await Directory('$absDataPath/$_core').create();
      await Directory('$absDataPath/models').create();
      await Directory('$absDataPath/repositories').create();
      await Directory('$absDataPath/contractors').create();
      await Directory('$absDataPath/data_providers').create();

      // ui directory
      print('creating ui directory...');
      await Directory(absUiPath).create();
      await Directory('$absUiPath/pages').create();
      await Directory('$absUiPath/dialogs').create();
      await Directory('$absUiPath/$_core').create();
      await Directory('$absUiPath/global').create();

      // utils directory
      print('creating utils directory...');
      await Directory('$basePath/$_utils').create();

      return true;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      return false;
    }
  }
}
