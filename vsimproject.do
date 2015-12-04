vsim project
view wave

add wave ir
add wave clk
add wave aluout
add wave raout
add wave b_select
add wave rfwrite
add wave ncvz
add wave aluop
add wave rbout
add wave rzout
add wave dataD
add wave MI_out 
add wave maRS
add wave memRead
add wave memWrite
add wave RM_out
add wave inA
add wave pcSelect
add wave pcEnable
add wave res
add wave incSelect
add wave ma_select

force clk 0 0, 1 1000 -repeat 2000
force res 0 0

run 120000
