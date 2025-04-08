import 'shapes.dart';

abstract class VehiclePart {
  String? id;
  String? name;
  String? description;
  Shape partShape;

  VehiclePart(this.id, this.name, this.description, this.partShape);
}
