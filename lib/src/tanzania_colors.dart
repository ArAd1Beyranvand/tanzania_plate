import 'package:flutter/widgets.dart';

/// Sampled from the flattened photographs (modal pixel of the region, balanced
/// against the photo). The article says "yellow" and "blue"; the pixels give a
/// warm `E1C246` on the one-row plate and a deeper `B98614` on the two-row
/// photo, which carries its own lighting, so they are two themes. The blue is
/// the international-organisation plate, white on `3B8FD0`.
abstract final class TanzaniaColors {
  static const Color yellow = Color(0xFFE1C246);
  static const Color yellowInk = Color(0xFF3B2B2F);

  static const Color amber = Color(0xFFB98614);
  static const Color amberInk = Color(0xFF1E1413);

  static const Color blue = Color(0xFF3B8FD0);
  static const Color blueInk = Color(0xFFF3F3F3);

  static const Color inactive = Color(0xFFB0B0B0);
}
