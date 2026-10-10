import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'tanzania_colors.dart';

/// One ink on one field. The photographs show no printed frame.
abstract final class TanzaniaThemes {
  static final PlateTheme private = _flat(
    TanzaniaColors.yellow,
    TanzaniaColors.yellowInk,
  );

  static final PlateTheme privateTwoRow = _flat(
    TanzaniaColors.amber,
    TanzaniaColors.amberInk,
  );

  /// International organisations: white on blue.
  static final PlateTheme organisation = _flat(
    TanzaniaColors.blue,
    TanzaniaColors.blueInk,
  );
}

PlateTheme _flat(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: TanzaniaColors.inactive,
  borderWidthRatio: 0,
  plateRadiusRatio: 0.05,
);
