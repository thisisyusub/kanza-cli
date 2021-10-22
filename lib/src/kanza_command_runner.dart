import 'dart:io';

import 'package:args/args.dart';

import 'command/create_command.dart';
import 'command/help_command.dart';
import 'command/i_command.dart';
import 'impl_directory_creator.dart';
import 'impl_file_creator.dart';
import 'impl_kanza_creator.dart';

class KanzaCommandRunner {
  void run(List<String> arguments) {
    final argParser = ArgParser();

    argParser.addCommand('create');
    argParser.addCommand('help');

    final res = argParser.parse(arguments);

    if (res.command != null && res.command!.name != null) {
      ICommand? command;

      switch (res.command!.name) {
        case 'create':
          command = CreateCommand();
          break;
        case 'help':
          command = HelpCommand();
          break;
        default:
          _errorAndExit(res.command!.name);
      }

      command!.execute();
    } else {
      _errorAndExit();
    }
  }
}

void _errorAndExit([String? command]) {
  stderr.writeln('Command not available!');
  stderr.writeln('try kanza_cli help for commands.');
  exit(2);
}

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
