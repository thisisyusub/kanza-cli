import 'dart:io';

import 'package:args/args.dart';

import 'impl_directory_creator.dart';
import 'impl_file_creator.dart';
import 'impl_kanza_creator.dart';

void start(List<String> arguments) {
  final argParser = ArgParser();
  argParser.addCommand('create');

  final res = argParser.parse(arguments);

  if (res.command != null && res.command!.name == 'create') {
    final directoryCreator = ImplDirectoryCreator();
    final fileCreator = ImplFileCreator(directoryCreator);

    final kanzaCreator = ImplKanzaCreator(
      directoryCreator: directoryCreator,
      fileCreator: fileCreator,
    );

    kanzaCreator.create().then((_) {
      print('\nended successfully!...\n');
    });
  } else {
    stderr.write('No command specified!');
    exit(1);
  }
}
