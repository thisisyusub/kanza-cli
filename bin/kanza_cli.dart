import 'dart:io';

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

  if (res.command != null && res.command!.name == 'create') {
    start();
  } else {
    stderr.write('No command specified!');
    exit(1);
  }
}
