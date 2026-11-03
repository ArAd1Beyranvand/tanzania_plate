FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the welcoming people of Tanzania to view examples:

https://platexample.ir/#/discover/tanzania:flutter

# tanzania_plate

Tanzania's licence plates for the plate_core library: yellow private plates in one and two rows and the blue organisation plate, with themes, alphabets and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/tanzania_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/tanzania:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/tanzania_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/tanzania:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/tanzania_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/tanzania:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/tanzania_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/tanzania:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  tanzania_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:tanzania_plate/tanzania_plate.dart';

PlateCanvas(
  spec: TanzaniaPlates.private,
  theme: TanzaniaThemes.private,
  validator: const TanzaniaValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `TanzaniaPlates.private` — id `tz.private`
- `TanzaniaPlates.privateTwoRow`
- `TanzaniaPlates.organisation`

## Themes

- `TanzaniaThemes.private`
- `TanzaniaThemes.privateTwoRow`
- `TanzaniaThemes.organisation`

## Change it

`PlateCanvas` takes `spec:` (an entry of `TanzaniaPlates`) and `theme:` (an entry of `TanzaniaThemes`). Set `validator:` to `TanzaniaValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `TanzaniaCountry` — the country panel.
- `TanzaniaValidator` — the plate validator.

## Plates

`private` is `T 995 AGT` on one row (groups `number`, `letters`);
`privateTwoRow` stacks `T 940` over `AGY`; `organisation` is the white on
blue plate of an international organisation, `T 258` over `CD 744` (groups
`organisation`, `number`).

Not implemented, for want of a usable reference: the Zanzibar motorcycle
plate, the national-park plate, and the diplomatic-mission, military and
older series. The hologram sticker is not drawn.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/tanzania_plate/blob/main/LICENSE).
