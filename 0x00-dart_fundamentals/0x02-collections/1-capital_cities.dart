void main() {
  Map<String, String> capitals = {"France": "Paris", "Japan": "Tokyo", "Brazil": "Brasilia"};
  capitals.addAll({"Canada": "Ottawa"});
  print(capitals["Japan"]);
  for(var pair in capitals.entries) {
    print("${pair.key}: ${pair.value}");
  }
}
