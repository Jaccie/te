lw    $0, 0($0)		#write 0 error
lw    $5, 4($0)		#$5 = 12345678
bne   $5, $0, 0x0001	#branch to add
halt	
add   $4, $5, $0	#$4 = 12345678
lw    $5, 0($0)		#$5 = 12345678
beq   $4, $5, 0x0001
NOP
NOP   (0x00800000)	#rs don't care
jal   0x0000004B
addi  $7, $31, 0x0000	#$31 fwd
lui   $2, 0xFF04	#rs don't care (0x3CE2FF04)
lw    $10,8($0) 	#$10 = AABBCCDD
addi  $6, $0, 0x0004    #$6 = 4
sw    $10,0($6)		#fwd for rs and rt
add  $4, $4, $5
add  $4, $4, $0
bne   $4, $5, 0x0005	#fwd for the nearest addi
mult  $4, $5 
mult  $4, $4		#overwrite HI,LO
lw    $3, C($0)		#$3 = 1023
mflo  $11		#rt = $3 but don't care (0x00035812)
lh    $0, 0($3)   	#write 0 & address overflow & misalignment
