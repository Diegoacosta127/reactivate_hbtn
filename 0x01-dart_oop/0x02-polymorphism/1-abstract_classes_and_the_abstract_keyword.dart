abstract class Animal {
  makeSound();
  sleep() {
    print("Sleeping...");
  }
}

class Dog extends Animal {
  @override
  makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  makeSound() {
    print("Meow!");
  }
}

void main() {
  Dog d = Dog();
  Cat c = Cat();

  d.makeSound();
  d.sleep();
  c.makeSound();
  c.sleep();
}
