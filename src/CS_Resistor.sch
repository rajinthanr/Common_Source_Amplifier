v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -110 0 -90 {lab=vdd}
N 0 -30 -0 60 {lab=vout}
N 0 0 100 -0 {lab=vout}
N -100 90 -40 90 {lab=vin}
N -0 120 -0 150 {lab=GND}
N 160 100 160 150 {lab=GND}
N 100 -0 190 -0 {lab=vout}
N 160 -0 160 40 {lab=vout}
N 30 90 30 120 {lab=GND}
N 0 90 30 90 {lab=GND}
C {sky130_fd_pr/res_generic_l1.sym} 0 -60 0 0 {name=R1
W=1
L=1700
model=res_generic_l1
mult=1}
C {gnd.sym} 0 150 0 0 {name=l1 lab=GND}
C {devices/code.sym} 10 -255 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} -455 -115 0 0 {name=SPICE only_toplevel=false value=
"
.option temp=27
.option gmin = 1e-12

vdd vdd 0 1.8
vin vin 0 dc 0.9 ac 0.1

*.dc vin 0 1.8 10m
.ac dec 10 10 100Meg

.saveall
.control
run
plot db(v(vout)/v(vin))
.endc
"}
C {ipin.sym} -100 90 0 0 {name=p1 lab=vin}
C {opin.sym} 190 0 0 0 {name=p2 lab=vout}
C {iopin.sym} 0 -110 2 0 {name=p3 lab=vdd}
C {sky130_fd_pr/cap_mim_m3_1.sym} 160 70 0 0 {name=C1 model=cap_mim_m3_1 W=40 L=90 MF=1 spiceprefix=X}
C {gnd.sym} 160 150 0 0 {name=l2 lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -20 90 0 0 {name=M1
W=2.25
L=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {gnd.sym} 30 120 0 0 {name=l3 lab=GND}
