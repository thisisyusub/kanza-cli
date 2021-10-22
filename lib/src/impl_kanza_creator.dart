import 'i_creators.dart';

class ImplKanzaCreator implements IKanzaCreator {
  final IDirectoryCreator directoryCreator;
  final IFileCreator fileCreator;

  ImplKanzaCreator({
    required this.directoryCreator,
    required this.fileCreator,
  });

  @override
  Future<void> create() async {
    await directoryCreator.createDirectories();
    await fileCreator.createNecessaryFiles();
  }
}
