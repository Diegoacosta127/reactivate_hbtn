import 'dart:io';

void main() {
    initializeLogFile();
    appendLogEntry();
    print(readLogFile().map((sentence) => '"$sentence"').toList());
    listStorageFiles().then((files) => print(files.map((file) => '"$file"').toList()));
}

initializeLogFile() async {
  try {
    var directory = await Directory('storage').create(recursive: true);
    File('${directory.path}/data.txt').writeAsString("User activity log initialized");
  } catch(er) {
    print("Error: LogFile could not be initialized. $er");
  }
}

appendLogEntry() {
  try{
    var currentDate = DateTime.now().toIso8601String();
    File('storage/data.txt').writeAsString("\n${currentDate}", mode: FileMode.append);
  } on FileSystemException catch(er) {
    print("Error: LogFile not found. $er");
  } catch(er) {
    print("Error: LogFile could not be appended. $er");
  }
}

List<String> readLogFile() {
  List<String> fileContent = [];
  try{
    fileContent = File('storage/data.txt').readAsLinesSync();
  } catch(er) {
    print("Error: LogFile could not be read. $er");
  }
  return fileContent;
}

Future<List<String>> listStorageFiles() async{
  List<String> files = [];
  try{
    var systemTempDir = Directory('storage');
    await for(var entity in systemTempDir.list(recursive: true, followLinks: false)) {
      files.add(entity.path.split('/').last);
    }
  } catch(er) {
    print("Error: not files found at 'storage' directory. $er");
  }
  return files;
}

bool deleteLogFileIfExists() {
  bool result = true;
  try{
    File('storage/data.txt').delete();
  } catch(er) {
    print("Error: LogFile could not be deleted. $er");
    result = false;
  }
  return result;
}
