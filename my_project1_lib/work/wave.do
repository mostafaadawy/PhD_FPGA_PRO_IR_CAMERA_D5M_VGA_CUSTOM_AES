onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /my_aes/clk_200
add wave -noupdate -format Logic /my_aes/clk_50
add wave -noupdate -format Logic /my_aes/rst
add wave -noupdate -format Logic /my_aes/ion
add wave -noupdate -format Logic /my_aes/ienc
add wave -noupdate -format Logic /my_aes/idec
add wave -noupdate -format Literal /my_aes/a
add wave -noupdate -format Literal /my_aes/b
add wave -noupdate -format Literal /my_aes/dec_a
add wave -noupdate -format Literal /my_aes/dec_b
add wave -noupdate -format Logic /my_aes/key_rdy
add wave -noupdate -divider internal
add wave -noupdate -format Logic /my_aes/en_encryption
add wave -noupdate -format Literal /my_aes/in_plain_data
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Logic /my_aes/cipher_rdy
add wave -noupdate -format Literal /my_aes/out_cipher_data
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Logic /my_aes/en_decryption
add wave -noupdate -format Literal /my_aes/in_cipher_data
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Logic /my_aes/plain_rdy
add wave -noupdate -format Literal /my_aes/out_plain_data
add wave -noupdate -divider {New Divider}
add wave -noupdate -format Logic /my_aes/chiper_intr
add wave -noupdate -format Literal /my_aes/ciphered_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12109 ns} 0}
configure wave -namecolwidth 450
configure wave -valuecolwidth 149
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {33600 ns}
