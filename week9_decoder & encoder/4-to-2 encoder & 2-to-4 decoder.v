// 4-to-2 encoder
module enc4to2(input [3:0]in, output reg [1:0]y);
	always @(in)
		begin
			case
				4'b1110:   y = 2'b00; // 0
				4'b1101:   y = 2'b01; // 1
				4'b1011:   y = 2'b10; // 2
				4'b0111:   y = 2'b11; // 3
				default:   y = 2'b00; // 4
			endcase
		end
endmodule

// 2-to-4 decoder
module dec2to4(input [1:0]in, output reg[3:0] y);
	always @(in)
		begin
			case(in)
				2'b00:   y = 4'b1110; // 0
				2'b01:   y = 4'b1101; // 1
				2'b10:   y = 4'b1011; // 2
				2'b11:   y = 4'b0111; // 3
				default:   y = 4'b1111;
			endcase
		end
endmodule
