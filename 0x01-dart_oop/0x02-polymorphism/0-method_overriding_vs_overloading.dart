class Shape {
  draw() {
    print("Drawing a shape");
  }
}

class Circle extends Shape {
  @override
  draw() {
    print("Drawing a circle");
  }
}

class Square extends Shape {
  @override
  draw() {
    print("Drawing a square");
  }
}

void main() {
  Shape s = Shape();
  Circle c = Circle();
  Square sq = Square();

  s.draw();
  c.draw();
  sq.draw();
}
