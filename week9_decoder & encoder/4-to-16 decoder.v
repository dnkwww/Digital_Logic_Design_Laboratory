module dec3to8(input [2:0]in, input en, output reg [7:0]y);
	always @(in)
		begin
			if(~en)
				begin
					case(in)
						3'b000: y = 8'b11111110; // 0
						3'b001: y = 8'b11111101; // 1
						3'b010: y = 8'b11111011; // 2
						3'b011: y = 8'b11110111; // 3
						3'b100: y = 8'b11101111; // 4
						3'b101: y = 8'b11011111; // 5
						3'b110: y = 8'b10111111; // 6
						3'b111: y = 8'b01111111; // 7
					endcase
				end
			else
				y = 8'b11111111;
		end
endmodule

module dec2to4(input [1:0]in, input en, output reg[3:0] y);
	always @(in)
		begin
			if(~en)
				begin
					case(in)
						2'b00: y = 4'b1110; // 0
						2'b01: y = 4'b1101; // 1
						2'b10: y = 4'b1011; // 2
						2'b11: y = 4'b0111; // 3
					endcase
				end
			else
				y = 4'b1111;
		end
endmodule

module test(input [3:0]in, input en, output [15:0]y); // 4-to-16
	wire [2:0]re;
	wire [7:0]control;
	assign re[2] = in[3];
	assign re[1] = in[2];
	assign re[0] = 1;
	wire [1:0]re2;
	assign re2[1] = in[1];
	assign re2[0] = in[0];
	dec3to8 a0(re, 0, control);
	dec3to8 a1(re2, control[1], y[3:0]);
	dec3to8 a2(re2, control[3], y[7:4]);
	dec3to8 a3(re2, control[5], y[11:8]);
	dec3to8 a4(re2, control[7], y[15:12]);
	
endmodule
