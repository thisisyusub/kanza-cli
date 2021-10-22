import 'dart:io';

import 'i_command.dart';

class HelpCommand implements ICommand {
  @override
  void execute() {
    stdout.writeln('Usage: kanza_cli <command>\n');

    stdout.writeln('Available commands:');
    stdout.writeln(
      'create        Create folder and file structure for Fluter Apps',
    );

    exit(0);
  }
}
