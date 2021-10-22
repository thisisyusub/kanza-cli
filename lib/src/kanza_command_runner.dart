import 'dart:io';

import 'package:args/args.dart';

import 'command/create_command.dart';
import 'command/help_command.dart';
import 'command/i_command.dart';
import 'command/pub_updater_command.dart';

class KanzaCommandRunner {
  void run(List<String> arguments) {
    final argParser = ArgParser();

    var createCommand = ArgParser();

    argParser.addCommand('create', createCommand);
    argParser.addCommand('help');
    createCommand.addFlag('get-packages');

    final ArgResults res;

    try {
      res = argParser.parse(arguments);
    } catch(_) {
      stderr.writeln('No command or flag available!\n');
      HelpCommand().execute();
      exit(2);
    }
   

    if (res.command != null && res.command!.name != null) {
      ICommand? command;

      switch (res.command!.name) {
        case 'create':
          final res = welcomeBoard();

          if (res) {
            bool isNeedPubUpdate =argParser.commands.containsKey('get-packages');
            print('isNeedPubUpdate: $isNeedPubUpdate');

            command = CreateCommand(
              nextCommand: isNeedPubUpdate ? PubUpdaterCommand() : null,
            );
          } else {
            exit(0);
          }
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

bool welcomeBoard() {
  String content = '''
+---------------------------------------------------+
|           Welcome to the Kanza CLI!               |
+---------------------------------------------------+
|        Do you want to continue? [y/n]             |
+---------------------------------------------------+\n''';

  stderr.write(content);

  final answer = stdin.readLineSync();
  final validator =
      answer?.toLowerCase() == 'y' || answer?.toLowerCase() == 'yes';

  return answer != null && validator;
}

void _errorAndExit([String? command]) {
  stderr.writeln('Command not available!');
  stderr.writeln('try kanza_cli help for commands.');
  exit(2);
}
