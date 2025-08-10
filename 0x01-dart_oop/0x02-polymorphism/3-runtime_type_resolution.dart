abstract class Animal {
  makeSound();
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
  List<Animal> pets = [Dog(), Cat()];

  for (var pet in pets) {
    print(pet.runtimeType);
    pet.makeSound();
    if (pet is Dog) {
      print("It's a dog");
    }
    if(pet is Cat) {
      print("```****");
    }
  }
}
