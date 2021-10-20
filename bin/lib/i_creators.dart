import 'dart:io';

abstract class IKanzaCreator {
  Future<void> create();
}

abstract class IDirectoryCreator {
  Future<void> createDirectories();

  Directory get blocDir;

  Directory get dataDir;

  Directory get uiDir;
}

abstract class IFileCreator {
  Future<void> createNecessaryFiles();
}

abstract class IPubspecCreator {
  Future<void> getPackageVersion();
}
