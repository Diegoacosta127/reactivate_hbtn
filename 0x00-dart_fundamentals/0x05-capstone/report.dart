import 'package:intl/intl.dart';
import 'package:characters/characters.dart';
void main(List<String> arguments) {
  if(arguments.length < 2) {
    print("Please provide more arguments.");
  } else {
    print(greetingMessage(arguments[0]));
    formatToday();
    print("\n${arguments[1]}\nTitle has ${countVisibleCharacters(arguments[1])} characters.\n");
    tasks(arguments);
  }
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

formatToday() {
  var currentDate = DateTime.now();
  var format = DateFormat.yMMMMEEEEd();
  print(format.format(currentDate));
}

countVisibleCharacters(String text) {
  return(text.characters.length);
}

tasks(List<String> args) {
  List<String> tasksList = [];
  int completedTasks = 0;
  for(int i = 2; i < args.length; i++) {
    tasksList.add(args[i]);
  }
  Map<String, String> tasksMap = {};
  final regex = RegExp(r'^(.+?):(true|false)$');
  tasksList.forEach((task) {
    if(regex.hasMatch(task)){
      tasksMap.addAll({task.split(":")[0]: task.split(":")[1]});
    } else {
      print("Unable to parse task: $task");
    }
  });
  for(var task in tasksMap.entries) {
    if(task.value == "true") {
      completedTasks++;
      print("✅ ${task.key}");
    } else {
      print("❌ ${task.key}");
    }
  }
  print("\nYou completed $completedTasks out of ${args.length - 2} tasks.");
}
