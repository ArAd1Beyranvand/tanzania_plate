FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the welcoming people of Tanzania to view examples:

https://platexample.ir/#/discover/tanzania:python

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

### Install (Python)

Copy `python/plates/countries/tanzania/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.tanzania.data import SPECS, THEMES

spec = SPECS["tz.private"]
theme = THEMES["TanzaniaThemes.private"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `tz.private`
- `tz.private.two_row`
- `tz.organisation`

## Themes

- `TanzaniaThemes.private`
- `TanzaniaThemes.privateTwoRow`
- `TanzaniaThemes.organisation`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `TanzaniaValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/tanzania_plate/blob/main/LICENSE).
