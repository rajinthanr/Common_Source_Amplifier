v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 30 60 45 {lab=GND}
N 50 30 60 30 {lab=GND}
N -280 -5 -250 -30 {lab=vin}
N -280 55 -280 77.5 {lab=GND}
C {/foss/designs/Assignment2/src/CS_Current_Mirror.sym} -100 0 0 0 {name=vin}
C {gnd.sym} 60 45 0 0 {name=l1 lab=GND}
C {devices/code.sym} -440 -35 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 150 -75 0 0 {name=SPICE only_toplevel=false value=
"
.option temp=27
.option gmin = 1e-12
.param vbias = 0.7180

vdd vdd 0 1.8
*vin vin 0 dc \{vbias\} ac 0.1
vin vin 0 dc \{vbias\} ac 0.01 0 SIN(\{vbias\} 0.01 100k)
iref iref 0 dc 0.327m

.dc vin 0 1.8 10m
.ac dec 10 10 200Meg


.tran 0.1u 20u 1n

.saveall
.control
run

setplot dc1
plot v(vin) v(vout) 0.9
plot -i(vdd) vs v(vin)


setplot ac1
plot db(v(vout)/v(vin))
*plot mag(ac1.v(vout))

setplot tran1
plot v(vin) v(vout)

.endc
"}
C {lab_pin.sym} 50 -30 2 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 50 -10 2 0 {name=p2 sig_type=std_logic lab=vout}
C {lab_pin.sym} 50 10 2 0 {name=p3 sig_type=std_logic lab=iref}
C {lab_pin.sym} -250 -30 0 0 {name=p5 sig_type=std_logic lab=vin}
C {vsource.sym} -280 25 0 0 {name=V1 value=3 savecurrent=false}
C {gnd.sym} -280 77.5 0 0 {name=l2 lab=GND}
