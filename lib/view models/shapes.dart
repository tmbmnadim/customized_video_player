abstract class Shape {
  double area();

  double perimeter();
}

abstract class Sides {
  int sides();
}

class Rectangle implements Shape, Sides {
  double height;
  double width;

  Rectangle(this.height, this.width);

  @override
  double area() {
    return height * width;
  }

  @override
  double perimeter() {
    return 2 * (height + width);
  }

  @override
  int sides() {
    return 4;
  }
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }

  @override
  double perimeter() {
    return 2 * 3.14 * radius;
  }
}
