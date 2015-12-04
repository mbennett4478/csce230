transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {project.vho}

do "C:/Users/John/OneDrive/Documents/CSCE230/project/csce230/vsimproject.do"
