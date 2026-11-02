import 'package:plate_core/plate_core.dart';

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
/// A fixed `T`, three digits, three letters; the organisation plate is `T`, a
/// three-digit code (200 to 399), `CD` and a three-digit number. Reports,
/// never bars a keystroke.
class TanzaniaValidator extends GatedPlateValidator {
  const TanzaniaValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonNumber = 'The number is three digits.';
  static const String reasonLetters = 'The series is three letters.';
  static const String reasonCode = 'The organisation code is 200 to 399.';
  static const String reasonCar = 'The car number is three digits.';

  // TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
  // TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
  // TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
  static final RegExp _code = RegExp(r'^[23][0-9]{2}$');
  static final RegExp _letters = RegExp(r'^[A-Z]{3}$');

  @override
  PlateValidation judge(PlateEntry entry) {
    final String organisation = entry.group('organisation');
    if (organisation.isNotEmpty) {
      if (!_code.hasMatch(organisation)) {
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
    if (!_letters.hasMatch(entry.group('letters'))) {
      return const PlateValidation.invalid(reasonLetters);
    }
    return const PlateValidation.valid();
  }
}
