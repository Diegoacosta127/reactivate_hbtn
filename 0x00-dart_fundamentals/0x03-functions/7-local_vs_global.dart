void main() {
  var message = "Global";
  printMessage();
  print(message);
}

printMessage() {
  var message = "Local";
  print(message);
}
