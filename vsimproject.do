vsim project
view wave

add wave clk
add wave res
add wave irin
add wave aluout
add wave dataD
add wave *

force clk 0 0, 1 20 -repeat 40
force res 0 0
force irin  000000000100001000000000  0, 000000000100001100000010 200, 000000000011010000110010 400, 000000000101010101000000 600, 000000000111011000110010 800, 000000000110011101000011 1000

run 1500