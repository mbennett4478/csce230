vsim project
view wave

add wave ir
add wave clk
add wave dataS
add wave dataT
add wave inA
add wave rbout
add wave aluout
add wave dataD
add wave rfwrite
add wave aluop
add wave MI_out 
add wave maRS
add wave memRead
add wave memWrite
add wave RM_out
add wave res
add wave muxyout
add wave ledG
add wave muxMA
add wave key
add wave mux2_out
add wave dat_out
add wave sw
add wave hex0

force res 0 0
force clk 0 0, 1 1000 -repeat 2000
force key 1011 0, 0111 125000 
force sw 0000011111 0
force hex0 0000000 0

run 240000
