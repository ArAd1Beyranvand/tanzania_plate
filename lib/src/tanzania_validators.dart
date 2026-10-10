import 'package:plate_core/plate_core.dart';

/// Judges a Tanzanian plate: a fixed `T`, three digits, three letters
/// (`T 995 AGT`); the organisation plate is `T`, a three-digit organisation
/// code (200 to 399), `CD` and a three-digit number. Reports, never bars a
/// keystroke.
class TanzaniaValidator extends GatedPlateValidator {
  const TanzaniaValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonNumber = 'The number is three digits.';
  static const String reasonLetters = 'The series is three letters.';
  static const String reasonCode = 'The organisation code is 200 to 399.';
  static const String reasonCar = 'The car number is three digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String organisation = entry.group('organisation');
    if (organisation.isNotEmpty) {
      final int? code = int.tryParse(organisation);
      if (organisation.length != 3 ||
          code == null ||
          code < 200 ||
          code > 399) {
        return const PlateValidation.invalid(reasonCode);
      }
      if (!isDigitsOfLength(entry.group('number'), 3)) {
        return const PlateValidation.invalid(reasonCar);
      }
      return const PlateValidation.valid();
    }
    if (!isDigitsOfLength(entry.group('number'), 3)) {
      return const PlateValidation.invalid(reasonNumber);
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(entry.group('letters'))) {
      return const PlateValidation.invalid(reasonLetters);
    }
    return const PlateValidation.valid();
  }
}
