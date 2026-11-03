import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:tanzania_plate/tanzania_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: TanzaniaPlates.private, theme: TanzaniaThemes.private),
);
