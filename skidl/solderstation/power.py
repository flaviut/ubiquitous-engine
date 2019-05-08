from typing import Iterable

from skidl import Part, Net, subcircuit

from solderstation.utils import assert_is_template


def buck_converter(
        nmos: Part,
        diode: Part,
        inductor: Part,
        cap_input: Part,
        cap_output: Part,
):
    """
    The body of a non-synchronous buck converter. The PWM mosfet driving
    signal should be passed to the 'pwm' net. Feedback and output power can be
    taken from the 'v_out' net.
    """
    assert_is_template(nmos, diode, inductor, cap_input, cap_output)

    @subcircuit
    def buck_impl(pwm: Net, v_in: Net, v_out: Net, gnd: Net):
        buck_inner_net = Net('buck_inner')

        nmos_inst = nmos.copy()
        nmos_inst['gate'] = pwm
        nmos_inst['drain'] = v_in
        nmos_inst['source'] = buck_inner_net

        inductor_inst = inductor.copy()
        inductor_inst['+'] = buck_inner_net
        inductor_inst['-'] = v_out

        diode_inst = diode.copy()
        diode_inst['-'] = buck_inner_net
        diode_inst['+'] = gnd

        cap_input_inst = cap_input.copy()
        cap_input_inst['+'] = v_in
        cap_input_inst['-'] = gnd
        cap_output_inst = cap_output.copy()
        cap_output_inst['+'] = v_in
        cap_output_inst['-'] = gnd

    return buck_impl


def diode_oring(diode: Part):
    """
    Takes a diode template part and builds a diode-based voltage or-er
    """
    assert_is_template(diode)

    @subcircuit
    def diode_oring_impl(v_in: Iterable[Net], v_out: Net):
        for in_net in v_in:
            diode_inst = diode.copy()
            diode_inst['-'] = v_out
            diode_inst['+'] = in_net

    return diode_oring_impl
