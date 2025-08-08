class Timer {
  int seconds;

  Timer({
    this.seconds = 0
  });

  start() {
    print("Timer started for $seconds seconds.");
  }
}

void main() {
  Timer t = Timer(seconds: 10);
  t.start();
}
