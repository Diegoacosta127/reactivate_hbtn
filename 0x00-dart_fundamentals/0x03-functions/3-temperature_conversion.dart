void main() {
  print("Celsius: ${toCelsius(98.6)}");
}

toCelsius(double fahrenheit) {
  return((fahrenheit - 32) * 5 / 9);
}
