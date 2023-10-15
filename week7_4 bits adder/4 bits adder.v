module half_adder(output S, C, input x, y);
        // instantiate primitive gates
	xor (S, x, y);
	and (C, x, y);
endmodule

module full_adder(output S, C, input x, y, z);
	wire S1, C1, C2; // Outputs of first XOR and two AND gates
	half_adder HA1(S1, C1, x, y);
	half_adder HA2(S, C2, S1, z);
	or g1(C,C2,C1); 
endmodule

module test(output C4, input[3:0] A, B, input C0, output [6:0] seg);
	wire C1, C2, C3;
	wire [3:0]Sum;
	full_adder FA0(Sum[0], C1, A[0], B[0], C0);
	full_adder FA1(Sum[1], C2, A[1], B[1], C1);
	full_adder FA2(Sum[2], C3, A[2], B[2], C2);
	full_adder FA3(Sum[3], C4, A[3], B[3], C3);
	segment7(Sum, seg);  
endmodule

module segment7(input wire [3:0]bcd, output reg [6:0] seg);
	always @(bcd)
	begin
		case (bcd) // case statement
			4'b0000 : seg = 7'b1000000;
			4'b0001 : seg = 7'b1111001;
			4'b0010 : seg = 7'b0100100;
			4'b0011 : seg = 7'b0110000;
			4'b0100 : seg = 7'b0011001;
			4'b0101 : seg = 7'b0010010;
			4'b0110 : seg = 7'b0000010;
			4'b0111 : seg = 7'b1111000;
			4'b1000 : seg = 7'b0000000;
			4'b1001 : seg = 7'b0010000;
			4'b1010 : seg = 7'b0001000;
			4'b1011 : seg = 7'b0000011;
			4'b1100 : seg = 7'b1000110;
			4'b1101 : seg = 7'b0100001;
			4'b1110 : seg = 7'b0000110;
			4'b1111 : seg = 7'b0001110;
                // switch off 7 segment character when the bcd digit is not a decimal number.
		default : seg = 7'b1110001; 
        	endcase
	end
endmodule
