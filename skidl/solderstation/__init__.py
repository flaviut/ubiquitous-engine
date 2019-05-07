from skidl.pyspice import *


def buck_converter(
        nmos: Part,
        diode: Part,
        inductor: Part,
        cap_input: Part,
        cap_output: Part,
):
    @subcircuit
    def buck_impl(pwm: Net, v_in: Net, v_out: Net, gnd: Net):
        buck_inner_net = Net('buck_inner')

        nmos['gate'] = pwm
        nmos['drain'] = v_in
        nmos['source'] = buck_inner_net

        inductor['+'] = buck_inner_net
        inductor['-'] = v_out

        diode['-'] = buck_inner_net
        diode['+'] = gnd

        cap_input['+'] = v_in
        cap_input['-'] = gnd
        cap_output['+'] = v_in
        cap_output['-'] = gnd

    return buck_impl


if __name__ == '__main__':
    buck_converter(
        mosfet(

        )
    )
