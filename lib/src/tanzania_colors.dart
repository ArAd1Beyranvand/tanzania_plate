import 'package:flutter/widgets.dart';

/// Modal pixels of the flattened photographs. The two-row photo carries its
/// own lighting and reads deeper than the one-row plate, so they are two
/// themes. [blue] is the international-organisation plate.
abstract final class TanzaniaColors {
  static const Color yellow = Color(0xFFE1C246);
  static const Color yellowInk = Color(0xFF3B2B2F);

  static const Color amber = Color(0xFFB98614);
  static const Color amberInk = Color(0xFF1E1413);

  static const Color blue = Color(0xFF3B8FD0);
  static const Color blueInk = Color(0xFFF3F3F3);

  static const Color inactive = Color(0xFFB0B0B0);
}
