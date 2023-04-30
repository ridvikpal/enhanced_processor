.define led_address 0x10
.define sw_address 	0x30
	
		mvt	r5, #led_address // store the address of the leds in r5
		mvt r4, #sw_address // store the address of the switches in r5
	
		mv	r0, #0 // r0 holds the counter value
		mv 	r1, #0 // initialize the r1 timer value
		mv r2, 	#0 // initialize r2 to 0
		
	
loop:	st r0, [r5]
		add r0, #1
		ld r2, [r4]
		add r2, #0
		beq delay_none		
		sub r2, #2 // check for switch 0
		bmi delay_3
		sub r2, #4 // check for switch 1
		bmi delay_4
		sub r2, #8 // check for switch 2
		bmi delay_5
		sub r2, #16 // check for switch 3
		bmi delay_6
		sub r2, #32 // check for switch 4
		bmi delay_7
		sub r2, #64 // check for switch 5
		bmi delay_8
		sub r2, #128 // check for switch 6
		bmi delay_9
		//sub r2, #256 // check for switch 7
		//bmi delay_7
		//sub r2, #512 // check for switch 8
		//bmi delay_8
		//sub r2, #1024 // check for switch 9
		//bmi delay_9

delay_none: mvt r1, #0xff
			add r1, #0x00
			b delay_loop

//delay_0: mv	r1, #0x32
//		 b delay_loop
		 
//delay_1: mv r1, #0x64
	//	 b delay_loop
		 
//delay_2: mv r1, #0xc8
	//	 b delay_loop

delay_3: mvt r1, #0x27
		 add r1, #0x10
		 b delay_loop

delay_4: mvt r1, #0x4e
		 add r1, #0x20
		 b delay_loop

delay_5: mvt r1, #0x75
		 add r1, #0x30
		 b delay_loop

delay_6: mvt r1, #0x9c
		 add r1, #0x40
		 b delay_loop

delay_7: mvt r1, #0xc3
		 add r1, #0x50
		 b delay_loop
		 
delay_8: mvt r1, #0xea
		 add r1, #0x60
		 b delay_loop

delay_9: mvt r1, #0xFF
		 add r1, #0xFF
		 b delay_loop
		 
delay_loop: sub r1, #1
		 beq loop
		 bne delay_loop