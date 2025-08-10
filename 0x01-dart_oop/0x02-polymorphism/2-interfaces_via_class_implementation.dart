class Flyable {
  fly(){}
}

class Bird implements Flyable {
  @override
  fly() {
    print("Bird is flying");
  }
}

class Plane implements Flyable {
  @override
  fly() {
    print("Plane is flying");
  }
}

void main() {
  Flyable f1 = Bird();
  Flyable f2 = Plane();

  f1.fly();
  f2.fly();
}
