transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA/22.1std/questa_fse/win64/ping_pong/ping_pong.vhd}

vcom -93 -work work {C:/intelFPGA/22.1std/questa_fse/win64/ping_pong/ping_pong_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L cyclonev_hssi -L rtl_work -L work -voptargs="+acc"  ping_pong_tb

add wave *
view structure
view signals
run -all
