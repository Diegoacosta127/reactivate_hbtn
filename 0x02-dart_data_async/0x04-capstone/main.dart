import 'dart:io';
import 'dart:convert';
import 'package:capstone/note.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

void main() async {

}

Future<void> initializeNoteFile() async {
  try {
    var directory = await Directory('storage').create(recursive: true);
    var file = File('${directory.path}/notes.json');
    if(!await file.exists()) await file.writeAsString("[]");
  } catch(er) {
    print("Error: notes.json could not be initialized. $er");
  }
}

Future<List<Note>> readNoteFile() async {
  try {
    var file = File('storage/notes.json');
    if(!await file.exists()) return [];
    String jsonString = await file.readAsString();
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((note) => Note.fromJson(note)).toList();
  } catch(er) {
    print("Error: notes.json could not be read. $er");
    return [];
  }
}

Future<void> saveNotes(List<Note> notes) async {
  try {
    var directory = await Directory('storage').create(recursive: true);
    var file = File('${directory.path}/notes.json');
    List<Note> existingNotes = await readNoteFile();
    existingNotes.addAll(notes);
    String jsonString = jsonEncode(existingNotes.map((note) => note.toJson()).toList());
    await file.writeAsString(jsonString);
  } catch(er) {
    print("Error: notes could not be saved in notes.json. $er");
  }
}

void interactiveCLI() {
  Note note = Note();
  print("Provide a title.");
  note.title = stdin.readLineSync();
  print("Provide a body.");
  note.body = stdin.readLineSync();
  note.id = Uuid().v1();
  note.createdAt = DateTime.now().toIso8601String();
  print(note.toJson());
  saveNotes([note]);
}

Future postRemote() async {
  try {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    List<Note> notes = await readNoteFile();
    for(var note in notes) {
      Map data = {"title": note.title,
                  "body": note.body,
                  "userId": note.id,
                  "createdAt": note.createdAt,
                  };
      var body = json.encode(data);
      await post(
        url,
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: body,
      );
    }
  } catch(er) {
    print("Error posting note to remote. $er");
  }
}

Future getRemote() async {
  Note note = Note();
  try {
    var data = await getJsonResponse(
      'https://jsonplaceholder.typicode.com/posts/1'
      );
    note.title = data['title'].toString();
    note.body = data['body'].toString();
    note.id = data['id'].toString();
    note.createdAt = DateTime.now().toIso8601String();
    saveNotes([note]);
  } catch(er) {
    print("Error retrieving remote note. $er");
  }
}

Future<Map<dynamic, dynamic>> getJsonResponse(String url) async {
  var response = await get(Uri.parse(url));
  return jsonDecode(response.body);
}

Stream<Note> emitWithDelay(List<Note> notes) async* {
  for(var note in notes) {
    await Future.delayed(Duration(seconds: 1));
    yield note;
  }
}
