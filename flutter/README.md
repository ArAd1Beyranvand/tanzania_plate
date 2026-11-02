FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the welcoming people of Tanzania to view examples:

https://platexample.ir/#/discover/tanzania

# tanzania_plate

Tanzania's licence plates for the `plate_core` library. Private one- and two-row and international-organisation plates, with themes, alphabets and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  tanzania_plate: ^0.1.0
```

## Use

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

## Contains

- `TanzaniaCountry` — country panel: `tanzania`.
- `TanzaniaPlates` — 3 plate specs: `private`, `privateTwoRow`, `organisation`.
- `TanzaniaThemes` — 3 themes: `private`, `privateTwoRow`, `organisation`.
- `TanzaniaValidator` — advisory validator; flags the frame, never blocks a keystroke.

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

