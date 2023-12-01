import 'dart:io';

Future<void> writeLog(String text) async {
  final File file = File('./log.txt');

  String? fileContent;

  try {
    fileContent = await file.readAsString();
  } catch (e) {
    fileContent = '';
  }

  fileContent += '\n$text';

  await file.writeAsString(fileContent);
}
