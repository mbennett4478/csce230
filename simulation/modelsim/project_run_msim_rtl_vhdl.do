transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/Reg_16.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/MUX2_1.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/variousLogic.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/multi4to1.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/multi2to1.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bitAdder.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bit16xor.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bit16or.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bit16and.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bit16add.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/MainMemory.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/PC_Temp.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/PC.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/MuxPC.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/MuxINC.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/Const.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/memFilesProcessor/Adder.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/alu.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/IR24.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/immediate.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/BuffReg16.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/registerFile.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/reg16.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/controlUnit.vhdl}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bit16multi4to1.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/bit16multi2to1.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/muxy.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/mux_ma.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/muxc.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/const15.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/decoder16.vhd}
vcom -93 -work work {C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/mux16.vhd}

do "C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/vsimproject.do"
