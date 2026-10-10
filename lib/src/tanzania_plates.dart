import 'package:flutter/widgets.dart' show AssetImage;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'tanzania_country.dart';

/// Where the ink sits, in plate units, from the flattened photographs
/// (`.plateref/tz/flat_*`, 4 px per unit).
///
/// One row (`Tanzanian_License_plate`, 520×110 as the article gives): ink y
/// 18–95 (77 tall). `T` centred 106, digits `995` centred 171, 220, 269
/// (pitch 49), letters `AGT` 380, 425, 470 (pitch 45). Flag x 12.5–65, y 54–86.
/// A 77-tall ink would need a 140 box on a 110 plate, so the box is the full
/// height and the ink lands near 60, about 78% of reference.
///
/// Two rows. The article gives one size, 520×110, but the two-row photographs
/// are 1.87 (private) and 1.47 (organisation) wide; flattened to 520×110 they
/// are stretched about 2.5 times, so the canvas takes the photo's own aspect at
/// height 110 and every x below is a fraction of the flat's 520. The true
/// millimetre size of a two-row plate is not in the article.
/// - Private (`TANZANIA_2000_s…woody1778a`, 206 wide): row 1 ink y 10–53.3,
///   `T` .309, digits .4615, .590, .719 (pitch .129); row 2 ink y 60–102.5,
///   letters .440, .574, .708 (pitch .134). Flag x .043–.19, y 11.75–29.
/// - Organisation (`Tanzania_vehicle_registration_Diplomatic_plates`, 162
///   wide): row 1 ink y 10.4–52, `T` .2875, digits .4475 + k·.1325; row 2 ink y
///   58.5–101, `CD` centred .296, digits .548 + k·.1375. Flag x .019–.181,
///   y 10–29.
/// Two-row ink is 43 tall; a box centred on it is at most 63 (private) before
/// it leaves the canvas, so the ink is about 35 (81%). The organisation plate's
/// narrower pitch caps the box near 50, ink about 27.
abstract final class _Layout {
  static const double oneRowWidth = 520, height = 110;
  static const double oneT = 106, oneDigit = 171, oneDigitPitch = 49;
  static const double oneLetter = 380, oneLetterPitch = 45;
  static const PlateBox oneFlag = PlateBox(12.5, 54, 52.5, 32);

  static const _Two private = _Two(
    width: 206,
    t: .309,
    digit: .4615,
    digitPitch: .129,
    row2: .440,
    row2Pitch: .134,
    box1Top: 0,
    box1: 63,
    box2Top: 52.4,
    box2: 57.6,
    flag: PlateBox(.043, 11.75, .147, 17.25),
  );

  static const _Two organisation = _Two(
    width: 162,
    t: .2875,
    digit: .4475,
    digitPitch: .1325,
    row2: .548,
    row2Pitch: .1375,
    box1Top: 6,
    box1: 50,
    box2Top: 56,
    box2: 48,
    flag: PlateBox(.019, 10, .162, 19),
    cd: .296,
  );
}

/// A two-row plate; x values are fractions of [width], y values are units.
class _Two {
  const _Two({
    required this.width,
    required this.t,
    required this.digit,
    required this.digitPitch,
    required this.row2,
    required this.row2Pitch,
    required this.box1Top,
    required this.box1,
    required this.box2Top,
    required this.box2,
    required this.flag,
    this.cd,
  });

  final double width, t, digit, digitPitch, row2, row2Pitch;
  final double box1Top, box1, box2Top, box2;

  /// x and width are fractions, y and height units.
  final PlateBox flag;

  /// Centre of the fixed `CD` on row 2, or null when row 2 is three letters.
  final double? cd;
}

/// The Tanzanian plates, one ink on one field with the national flag at the
/// left.
///
/// [private] is `T 995 AGT` on one row (groups `number`, `letters`);
/// [privateTwoRow] stacks `T 940` over `AGY`; [organisation] is the white on
/// blue plate of an international organisation, `T 258` over `CD 744` (groups
/// `organisation`, `number`).
///
/// Not implemented, each for want of a usable reference: the Zanzibar
/// motorcycle plate (the photo is 1.04 wide with a Zanzibar emblem that
/// cannot be placed on the article's size); the national-park plate (the plate
/// fills under two thirds of its flat's height on a yellow field, while the
/// article says green with `01JUL` series, so neither can be trusted); the
/// green-and-yellow diplomatic-mission, military (white on black) and older
/// series. The `United_Kingdom_license_plate_T811_BFE` picture is a British
/// plate, not Tanzanian. The hologram sticker is not drawn.
abstract final class TanzaniaPlates {
  // Flag: https://commons.wikimedia.org/wiki/File:Flag_of_Tanzania.svg
  static const AssetImage _flag = AssetImage(
    'assets/icons/flag_of_tanzania.png',
    package: 'tanzania_plate',
  );

  static final PlateSpec private = PlateSpec(
    id: 'tz.private',
    country: TanzaniaCountry.tanzania,
    canvasWidth: _Layout.oneRowWidth,
    canvasHeight: _Layout.height,
    noPanel: true,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    background: PlateSection.plain,
    decals: const <PlateDecal>[PlateDecal(image: _flag, box: _Layout.oneFlag)],
    slots: <PlateSlot>[
      ..._group(
        TanzaniaAlphabets.digits,
        3,
        _Layout.oneDigit,
        _Layout.oneDigitPitch,
        0,
        _Layout.height,
      ),
      ..._group(
        TanzaniaAlphabets.letters,
        3,
        _Layout.oneLetter,
        _Layout.oneLetterPitch,
        0,
        _Layout.height,
      ),
    ],
    labels: <PlateLabel>[
      _label('T', _Layout.oneT, _Layout.oneDigitPitch, 0, _Layout.height),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1, 2], key: 'number'),
      PlateTextGroup(<int>[3, 4, 5], key: 'letters'),
    ],
  );

  static final PlateSpec privateTwoRow = _twoRow(
    'tz.private.two_row',
    _Layout.private,
  );

  static final PlateSpec organisation = _twoRow(
    'tz.organisation',
    _Layout.organisation,
    organisation: true,
  );

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    privateTwoRow,
    organisation,
  ];

  static PlateSpec _twoRow(String id, _Two l, {bool organisation = false}) {
    final double w = l.width;
    final double pitch1 = l.digitPitch * w;
    final double pitch2 = l.row2Pitch * w;
    return PlateSpec(
      id: id,
      country: TanzaniaCountry.tanzania,
      canvasWidth: w,
      canvasHeight: _Layout.height,
      noPanel: true,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      background: PlateSection.plain,
      decals: <PlateDecal>[
        PlateDecal(
          image: _flag,
          box: PlateBox(
            l.flag.left * w,
            l.flag.top,
            l.flag.width * w,
            l.flag.height,
          ),
        ),
      ],
      slots: <PlateSlot>[
        ..._group(
          TanzaniaAlphabets.digits,
          3,
          l.digit * w,
          pitch1,
          l.box1Top,
          l.box1,
        ),
        ..._group(
          organisation ? TanzaniaAlphabets.digits : TanzaniaAlphabets.letters,
          3,
          l.row2 * w,
          pitch2,
          l.box2Top,
          l.box2,
        ),
      ],
      labels: <PlateLabel>[
        _label('T', l.t * w, pitch1, l.box1Top, l.box1),
        if (l.cd != null)
          _label('CD', l.cd! * w, pitch2 * 2, l.box2Top, l.box2),
      ],
      textGroups: <PlateTextGroup>[
        PlateTextGroup(const <int>[
          0,
          1,
          2,
        ], key: organisation ? 'organisation' : 'number'),
        PlateTextGroup(const <int>[
          3,
          4,
          5,
        ], key: organisation ? 'number' : 'letters'),
      ],
    );
  }

  static List<PlateSlot> _group(
    PlateAlphabet alphabet,
    int count,
    double firstCx,
    double pitch,
    double top,
    double height,
  ) => plateRegister(
    alphabet: alphabet,
    count: count,
    left: firstCx - pitch / 2,
    top: top,
    width: pitch,
    height: height,
  );

  static PlateLabel _label(
    String text,
    double cx,
    double width,
    double top,
    double height,
  ) => PlateLabel(
    text: text,
    box: PlateBox(cx - width / 2, top, width, height),
    glyphHeight: height,
  );
}
