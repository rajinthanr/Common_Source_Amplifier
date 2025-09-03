v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -260 0 -160 0 {lab=vout}
N -360 90 -300 90 {lab=vin}
N -260 120 -260 150 {lab=GND}
N -100 100 -100 150 {lab=GND}
N -160 0 -70 0 {lab=vout}
N -100 0 -100 40 {lab=vout}
N -230 90 -230 120 {lab=GND}
N -260 90 -230 90 {lab=GND}
N -260 -30 -260 60 {lab=vout}
N -260 -60 -240 -60 {lab=vdd}
N -240 -100 -240 -60 {lab=vdd}
N -260 -100 -240 -100 {lab=vdd}
N -510 -160 -510 -90 {lab=vdd}
N -510 -160 -260 -160 {lab=vdd}
N -260 -160 -260 -90 {lab=vdd}
N -530 -60 -510 -60 {lab=vdd}
N -530 -100 -530 -60 {lab=vdd}
N -530 -100 -510 -100 {lab=vdd}
N -470 -60 -300 -60 {lab=iref}
N -510 -30 -510 60 {lab=iref}
N -510 -10 -450 -10 {lab=iref}
N -450 -60 -450 -10 {lab=iref}
C {gnd.sym} -260 150 0 0 {name=l1 lab=GND}
C {devices/code.sym} -740 -215 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} 25 -195 0 0 {name=SPICE only_toplevel=false value=
"
.option temp=27
.option gmin = 1e-12
.param vbias = 0.7172

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
C {ipin.sym} -360 90 0 0 {name=p1 lab=vin}
C {opin.sym} -70 0 0 0 {name=p2 lab=vout}
C {iopin.sym} -390 -160 3 0 {name=p3 lab=vdd}
C {sky130_fd_pr/cap_mim_m3_1.sym} -100 70 0 0 {name=C1 model=cap_mim_m3_1 W=40 L=87 MF=1 spiceprefix=X}
C {gnd.sym} -100 150 0 0 {name=l2 lab=GND}
C {gnd.sym} -230 120 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} -280 -60 0 0 {name=M2
W=170
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
C {sky130_fd_pr/nfet_01v8.sym} -280 90 0 0 {name=M1
W=120
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
C {sky130_fd_pr/pfet_01v8.sym} -490 -60 0 1 {name=M3
W=170
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
C {iopin.sym} -510 60 1 0 {name=p4 lab=iref}
