import 'package:intl/intl.dart';
import 'package:characters/characters.dart';
void main() {
  formatToday();
  print("Visible characters: ${countVisibleCharacters("👨‍👩‍👧‍👦 family")}");
  print(greetingMessage("Ada"));
  printEachCharacter("Dart 🚀");
}

formatToday() {
  var currentDate = DateTime.now();
  var format = DateFormat.yMMMMEEEEd();
  print(format.format(currentDate));
}

countVisibleCharacters(String text) {
  return(text.characters.length);
}

greetingMessage(String name) {
  String greeting = "";
  int currentDate = DateTime.now().hour;
  switch(currentDate) {
    case >= 5 && <= 11 :
      greeting = "Good morning, $name!";
      break;
    case >= 12 && <= 17:
      greeting = "Good afternoon, $name!";
      break;
    default:
      greeting = "Good evening, $name!";
      break;
  }
  return greeting;
}

printEachCharacter(String input) {
  for(var char in input.characters) {
    print(char);
  }
}
