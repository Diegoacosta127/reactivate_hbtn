void main() {
  printMultiples(3);
  printMultiples(4, 3);
}

printMultiples(int number, [int max = 5]) {
  List<int> multiples = [];
  for(int i = 1; i <= max; i++) {
    multiples.add(i * number);
  }
  print(multiples.join(" "));
}
