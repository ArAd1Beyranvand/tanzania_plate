import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';
import 'package:tanzania_plate/tanzania_plate.dart';

void main() {
  plateGoldens('tz', TanzaniaCountry.tanzania, <String, PlateGoldenCase>{
    'private': (TanzaniaPlates.private, TanzaniaThemes.private, '995 AGT'),
    'private_two_row': (
      TanzaniaPlates.privateTwoRow,
      TanzaniaThemes.privateTwoRow,
      '940 AGY',
    ),
    'organisation': (
      TanzaniaPlates.organisation,
      TanzaniaThemes.organisation,
      '258 744',
    ),
  }, decodeDelay: const Duration(milliseconds: 300));

  test('each spec is two fields, complete when both are full', () {
    for (final PlateSpec spec in TanzaniaPlates.all) {
      expect(spec.slots.length, 2, reason: spec.id);
      expect(spec.slots.every((s) => s.length == 3), isTrue, reason: spec.id);
    }
    final PlateController c = PlateController.fromValues(
      TanzaniaPlates.private,
      ['995', 'AG'],
    );
    expect(c.isCompleted, isFalse);
    c.setAt(1, 'AGT');
    expect(c.isCompleted, isTrue);
    c.dispose();
  });
}
