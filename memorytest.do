vsim MemoryInterface
view wave

add wave DataOut
add wave MFC
add wave Address

force clock 0 0, 1 1000 -repeat 2000
force Address 0000000000000001 0 , 0000000000000010 4000
force MEM_read 0 1
force MEM_write 0 0

run 120000