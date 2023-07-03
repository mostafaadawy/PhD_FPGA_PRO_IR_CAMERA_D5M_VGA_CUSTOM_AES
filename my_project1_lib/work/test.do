force -freeze sim:/my_aes/a 0000111100001111 0
force -freeze sim:/my_aes/b 1010101010101010 0
force -freeze sim:/my_aes/clk_200 1 0, 0 {12 ns} -r 25
force -freeze sim:/my_aes/clk_50 1 0, 0 {50 ns} -r 100
force -freeze sim:/my_aes/idec 0 0
force -freeze sim:/my_aes/ienc 0 0
force -freeze sim:/my_aes/ioff 0 0
force -freeze sim:/my_aes/ion 0 0
force -freeze sim:/my_aes/rst 0 0
run 1000
force -freeze sim:/my_aes/rst 1 0
run 10000
force -freeze sim:/my_aes/ion 1 0
run 10000
force -freeze sim:/my_aes/ienc 1 0
run 10000
force -freeze sim:/my_aes/idec 1 0
run 10000
