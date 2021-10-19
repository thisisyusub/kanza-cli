import 'impl_directory_creator.dart';
import 'impl_file_creator.dart';
import 'impl_kanza_creator.dart';

void start() {
  final directoryCreator = ImplDirectoryCreator();
  final fileCreator = ImplFileCreator(directoryCreator);

  final kanzaCreator = ImplKanzaCreator(
    directoryCreator: directoryCreator,
    fileCreator: fileCreator,
  );

  kanzaCreator.create();
}
