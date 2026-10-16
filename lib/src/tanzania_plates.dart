import 'dart:math';

import 'package:flutter/widgets.dart' show AssetImage;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'tanzania_country.dart';

/// Ink positions in plate units, from the flattened photographs.
///
/// The one-row plate is the article's 520x110. A 77-tall ink would need a 140
/// box on a 110 plate, so the box is the full height and the ink lands near
/// 78% of reference.
///
/// The two-row photographs are far narrower than the article's size, which is
/// not known for them, so the canvas takes each photo's own aspect at height
/// 110 and every x is a fraction of the width. A box centred on the 43-tall
/// ink is at most 63 (private) before it leaves the canvas; the organisation
/// plate's narrower pitch caps its box near 50.
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

/// [private] is `T 995 AGT` on one row (groups `number`, `letters`);
/// [privateTwoRow] stacks `T 940` over `AGY`; [organisation] is the white on
/// blue plate of an international organisation, `T 258` over `CD 744` (groups
/// `organisation`, `number`).
///
/// Not implemented, for want of a usable reference: the Zanzibar motorcycle
/// plate, the national-park plate, and the diplomatic-mission, military and
/// older series. The hologram sticker is not drawn.
abstract final class TanzaniaPlates {
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
      _group(
        TanzaniaAlphabets.digits,
        3,
        _Layout.oneDigit,
        _Layout.oneDigitPitch,
        0,
        _Layout.height,
      ),
      _group(
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
      PlateTextGroup(<int>[0], key: 'number'),
      PlateTextGroup(<int>[1], key: 'letters'),
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
        _group(
          TanzaniaAlphabets.digits,
          3,
          l.digit * w,
          pitch1,
          l.box1Top,
          l.box1,
        ),
        _group(
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
        ], key: organisation ? 'organisation' : 'number'),
        PlateTextGroup(const <int>[
          1,
        ], key: organisation ? 'number' : 'letters'),
      ],
    );
  }

  static PlateSlot _group(
    PlateAlphabet alphabet,
    int count,
    double firstCx,
    double pitch,
    double top,
    double height,
  ) => PlateSlot(
    alphabet: alphabet,
    box: PlateBox(firstCx - pitch / 2, top, count * pitch, height),
    length: count,
    spacing: max(0, pitch - 0.6 * 0.72 * height),
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
