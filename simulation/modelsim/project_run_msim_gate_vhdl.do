transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {project_fast.vho}

do "//cse-redirect/Redirect/mbennett/My Documents/GitHub/csce230/vsimproject.do"
