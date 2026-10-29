/// Tanzania's licence plates for the `plate_core` library.
///
/// Private one- and two-row and international-organisation plates, with
/// themes, alphabets and an advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.tanzania`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/tanzania`; tree-shakable.
// TODO(kt): [D5] package `countries.tanzania` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show TanzaniaAlphabets;

export 'src/tanzania_colors.dart';
export 'src/tanzania_country.dart';
export 'src/tanzania_plates.dart';
export 'src/tanzania_themes.dart';
export 'src/tanzania_validators.dart';
