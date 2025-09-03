v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 0 100 0 {lab=vout}
N -100 90 -40 90 {lab=vin}
N 0 120 0 150 {lab=GND}
N 160 100 160 150 {lab=GND}
N 100 0 190 0 {lab=vout}
N 160 0 160 40 {lab=vout}
N 30 90 30 120 {lab=GND}
N 0 90 30 90 {lab=GND}
N 0 -30 0 60 {lab=vout}
N -0 -60 20 -60 {lab=vdd}
N -90 -120 -0 -120 {lab=vdd}
N 0 -200 0 -90 {lab=vdd}
N 20 -100 20 -60 {lab=vdd}
N 0 -100 20 -100 {lab=vdd}
N -90 -60 -40 -60 {lab=#net1}
C {gnd.sym} 0 150 0 0 {name=l1 lab=GND}
C {devices/code.sym} -470 -285 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code_shown.sym} -455 -125 0 0 {name=SPICE only_toplevel=false value=
"
.option temp=27
.option gmin = 1e-12

vdd vdd 0 1.8
*vin vin 0 dc 0.753 ac 0.1
vin vin 0 dc 0.753 ac 0.01 0 SIN(0.753 0.01 100k)

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
C {ipin.sym} -100 90 0 0 {name=p1 lab=vin}
C {opin.sym} 190 0 0 0 {name=p2 lab=vout}
C {iopin.sym} 0 -200 2 0 {name=p3 lab=vdd}
C {sky130_fd_pr/cap_mim_m3_1.sym} 160 70 0 0 {name=C1 model=cap_mim_m3_1 W=40 L=87 MF=1 spiceprefix=X}
C {gnd.sym} 160 150 0 0 {name=l2 lab=GND}
C {gnd.sym} 30 120 0 0 {name=l3 lab=GND}
C {vsource.sym} -90 -90 0 0 {name=V1 value=1.3 savecurrent=false}
C {sky130_fd_pr/pfet_01v8.sym} -20 -60 0 0 {name=M2
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
C {sky130_fd_pr/nfet_01v8.sym} -20 90 0 0 {name=M1
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
