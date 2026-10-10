import 'package:plate_core/plate_core.dart';

import 'tanzania_colors.dart';

/// Tanzania as a `PlateCountry`. The plates have no side band; the national
/// flag is a decal on each spec, so there is no panel and no caption.
abstract final class TanzaniaCountry {
  static const PlateCountry tanzania = PlateCountry(
    code: 'tz',
    captionLines: <String>[],
    panelColor: TanzaniaColors.yellow,
    panelTextColor: TanzaniaColors.yellowInk,
  );
}
