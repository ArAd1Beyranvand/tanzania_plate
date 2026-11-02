import 'package:plate_core/plate_core.dart';

import 'tanzania_colors.dart';

/// No side band; the flag is a decal on each spec.
abstract final class TanzaniaCountry {
  static const PlateCountry tanzania = PlateCountry(
    code: 'tz',
    captionLines: <String>[],
    panelColor: TanzaniaColors.yellow,
    panelTextColor: TanzaniaColors.yellowInk,
  );
}
