import 'dart:io';

class Helper {
  Future<bool> writeFile(String filePaths, String data) async {
    File f = new File(filePaths);
    await f.writeAsString(data);
    return true;
  }

  Future<bool> appendFile(String filePaths, String data) async {
    File f = new File(filePaths);
    await f.writeAsString(data, mode: FileMode.append);
    return true;
  }

  Future<String> readFile(String filePaths) async {
    File f = new File(filePaths);
    var data = await f.readAsString();
    return data;
  }
}
