class Animal {
  String name = '';

  speak() {
    print("Some sound");
  }
}

void main() {
  Animal a = Animal();
  a.name = 'Generic';
  a.speak();
}
