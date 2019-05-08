import itertools
from typing import Union, Tuple, Iterable, List

from skidl import Part, Net, subcircuit
from typing_extensions import Protocol

from solderstation.utils import assert_is_template, DECADES, RESISTOR_SERIES


class VoltageDivider(Protocol):
    def __call__(self, v_in: Net, gnd: Net, out: Net) -> None:
        raise NotImplementedError


def voltage_divider(
        resistor_model: Part,
        ratio: Union[Tuple[float, float], float],
        ratio_tolerance: float = 0.05,
        total_resistance: float = 100_000,
        total_resistance_tolerance: float = 0.2,
        series: Union[str, Iterable[float]] = "E96+E24") -> VoltageDivider:
    """
    Builds a resistive divider for the given constraints

    :param resistor_model: The model of resistor to use for the calculation.
        The value will be replaced with the correct value for this application.
    :param ratio: Either the ratio of the input to the output (i.e. v_in *
        ratio = v_out), or a tuple representing (v_in, v_out), in which case
        the ratio will be calculated automatically.
    :param ratio_tolerance: The maximum offset from the desired ratio that is
        allowed. If this tolerance is exceeded, then an error will be raised.
    :param total_resistance: The desired overall resistance for this voltage
        divider. This is a numeric value, in ohms.
    :param total_resistance_tolerance: The maximum offset from the desired
        overall resistance that is allowed. If this tolerance is exceeded, then
        an error will be raised
    :param series: The resistor series to search for valid resistor values.
        This must be a key from :ref:constant:`utils.RESISTOR_SERIES` or an
        iterable
    """
    assert_is_template(resistor_model)

    try:
        # maybe the ratio is a tuple?
        ratio = ratio[1] / ratio[0]
    except IndexError:
        # it's a number
        pass

    if ratio >= 1:
        raise ValueError('Ratio must be a number between '
                         '0 and 1, got {}'.format(ratio))

    def calc_v_ratio(upper, lower):
        return upper / (upper + lower)

    def meets_tolerance(val, target, tolerance):
        return (target + target * tolerance) > val > (
                target - target * tolerance)

    def optimize_resistance(series_list: List[float]):
        all_values = []
        for decade in DECADES:
            all_values.extend(v * decade for v in series_list)

        results = {
            abs(calc_v_ratio(upper, lower) - ratio): (upper, lower)
            for (upper, lower) in itertools.product(all_values, repeat=2)
            if meets_tolerance(upper + lower, total_resistance,
                               total_resistance_tolerance)
        }

        try:
            best_key = sorted(results.keys())[0]
        except IndexError:
            raise ValueError('Could not find any values within the given '
                             'total_resistance tolerance')
        upper, lower = results[best_key]
        if meets_tolerance(calc_v_ratio(upper, lower), ratio, ratio_tolerance):
            return upper, lower
        else:
            raise ValueError(
                ('Could not find resistor values for given '
                 'requirements ({}). Best was ({}, {}), with ratio {}.'
                 ).format(ratio, upper, lower,
                          calc_v_ratio(upper, lower)))

    upper_val, lower_val = optimize_resistance(
        RESISTOR_SERIES.get(series, series))

    @subcircuit
    def voltage_divider_impl(v_in: Net, gnd: Net, out: Net) -> None:
        upper_inst = resistor_model.copy(value=upper_val)
        lower_inst = resistor_model.copy(value=lower_val)

        upper_inst[1] += v_in
        upper_inst[2] += out
        lower_inst[1] += out
        lower_inst[2] += gnd

    return voltage_divider_impl
