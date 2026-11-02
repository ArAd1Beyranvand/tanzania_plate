"""Port of tanzania_plate/lib/src/tanzania_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re
from dataclasses import dataclass

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length

_CODE = re.compile(r'[23][0-9]{2}')
_LETTERS = re.compile(r'[A-Z]{3}')


@dataclass(frozen=True)
class TanzaniaValidator(GatedPlateValidator):
    gate_group = 'number'

    REASON_NUMBER = 'The number is three digits.'
    REASON_LETTERS = 'The series is three letters.'
    REASON_CODE = 'The organisation code is 200 to 399.'
    REASON_CAR = 'The car number is three digits.'

    def judge(self, entry: PlateEntry) -> PlateValidation:
        organisation = entry.group('organisation')
        number_ok = is_digits_of_length(entry.group('number'), 3)
        if organisation:
            if not _CODE.fullmatch(organisation):
                return PlateValidation.invalid(self.REASON_CODE)
            return PlateValidation.valid() if number_ok else PlateValidation.invalid(self.REASON_CAR)
        if not number_ok:
            return PlateValidation.invalid(self.REASON_NUMBER)
        if not _LETTERS.fullmatch(entry.group('letters')):
            return PlateValidation.invalid(self.REASON_LETTERS)
        return PlateValidation.valid()
