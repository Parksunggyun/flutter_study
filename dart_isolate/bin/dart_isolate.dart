import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

Future<void> main() async {
  final Map<String, dynamic> jsonData =
      await Isolate.run(() => _readAndParseJson('json_01.json'));

      print('Received JSON with ${jsonData.length} keys');
}

Future<Map<String, dynamic>> _readAndParseJson(String filename) async {
  final String fileData = await File(filename).readAsString();
  final Map<String, dynamic> jsonData =
      jsonDecode(fileData) as Map<String, dynamic>;
  return jsonData;
}
