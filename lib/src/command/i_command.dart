import 'dart:async';

abstract class ICommand {
  FutureOr<void> execute();
}
