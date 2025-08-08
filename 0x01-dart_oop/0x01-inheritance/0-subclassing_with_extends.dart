class Vehicle {
  String type = 'Generic Vehicle';

  describe() {
    print("This is a $type.");
  }
}

class Car extends Vehicle {
  int wheels = 4;
}

void main() {
  Car myCar = Car();
  print(myCar.type);
  print(myCar.wheels);
  myCar.describe();
}
