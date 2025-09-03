v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -270 0 -170 0 {lab=vout}
N -370 90 -310 90 {lab=vin}
N -270 120 -270 150 {lab=GND}
N -110 100 -110 150 {lab=GND}
N -170 0 -80 0 {lab=vout}
N -110 0 -110 40 {lab=vout}
N -240 90 -240 120 {lab=GND}
N -270 90 -240 90 {lab=GND}
N -270 -30 -270 60 {lab=vout}
N -270 -60 -250 -60 {lab=vdd}
N -360 -120 -270 -120 {lab=vdd}
N -270 -200 -270 -90 {lab=vdd}
N -250 -100 -250 -60 {lab=vdd}
N -270 -100 -250 -100 {lab=vdd}
N -360 -60 -310 -60 {lab=#net1}
C {gnd.sym} -270 150 0 0 {name=l1 lab=GND}
C {devices/code.sym} -640 -185 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 15 -185 0 0 {name=SPICE only_toplevel=false value=
"
.option temp=27
.option gmin = 1e-12
.param vbias=0.7723

vdd vdd 0 1.8
*vin vin 0 dc \{vbias\} ac 0.1
vin vin 0 dc \{vbias\} ac 0.01 0 SIN(\{vbias\} 0.01 100k)
iref iref 0 dc 0.5m

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
C {ipin.sym} -370 90 0 0 {name=p1 lab=vin}
C {opin.sym} -80 0 0 0 {name=p2 lab=vout}
C {iopin.sym} -270 -200 2 0 {name=p3 lab=vdd}
C {sky130_fd_pr/cap_mim_m3_1.sym} -110 70 0 0 {name=C1 model=cap_mim_m3_1 W=40 L=87 MF=1 spiceprefix=X}
C {gnd.sym} -110 150 0 0 {name=l2 lab=GND}
C {gnd.sym} -240 120 0 0 {name=l3 lab=GND}
C {vsource.sym} -360 -90 0 0 {name=V1 value=1.26 savecurrent=false}
C {sky130_fd_pr/pfet_01v8.sym} -290 -60 0 0 {name=M2
W=161
L=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -290 90 0 0 {name=M1
W=70
L=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
