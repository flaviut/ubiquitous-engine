from skidl import Part, Net, ERC, TEMPLATE, generate_netlist

from solderstation.signal import voltage_divider

FOOTPRINT_R_0603 = 'Resistor_SMD:R_0603_1608Metric'

if __name__ == '__main__':
    v_in = Net('v_in')
    out = Net('out')
    gnd = Net('gnd')
    voltage_divider(
        Part('Device', 'R', footprint=FOOTPRINT_R_0603, dest=TEMPLATE),
        ratio=(24, 2)
    )(v_in=v_in, gnd=gnd, out=out)
    ERC()
    generate_netlist()
