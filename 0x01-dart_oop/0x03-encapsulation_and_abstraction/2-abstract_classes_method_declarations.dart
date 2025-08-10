abstract class Device {
  turnOn();
}

class Printer implements Device {
  @override
  turnOn() {
    print("Printer is now ON");
  }
}

class Monitor implements Device {
  @override
  turnOn() {
    print("Monitor is now ON");
  }
}

void main() {
  Device printer = Printer();
  Device monitor = Monitor();

  printer.turnOn();
  monitor.turnOn();
}
