import 'dart:io';

import 'i_command.dart';

class HelpCommand implements ICommand {
  @override
  void execute() {
    stdout.writeln('Usage: kanza_cli <command>\n');

    stdout.writeln('Global options:');
     stdout.writeln(
      '--get-packages        Get some packages with latest releases '
      'from pub.dev\n',
    );

    stdout.writeln('Available commands:');
    stdout.writeln(
      'create        Create folder and file structure for Fluter Apps',
    );

    exit(0);
  }
}
