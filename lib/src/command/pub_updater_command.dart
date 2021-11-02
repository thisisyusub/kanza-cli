import 'dart:async';
import 'i_command.dart';

import '../structure_creators/pubspec/impl_pubspec_creator.dart';

class PubUpdaterCommand implements ICommand {
  @override
  Future<void> execute() {
    ImplPubspecCreator pubspecCreator = ImplPubspecCreator();
    return pubspecCreator.getPackageVersion();
  }
}
