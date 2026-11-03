FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the welcoming people of Tanzania to view examples:

https://platexample.ir/#/discover/tanzania:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/tanzania/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.tanzania.country

val spec = country.specs["tz.private"]
println(country.pkg)
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

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`TanzaniaValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/tanzania_plate/blob/main/LICENSE).
