module test(input in, input [2:0]s, output reg [7:0]out); // 一個input data & 3個Selection & 8個output data
	always@(in or s)
		begin
			case(s)
				3'b000 : out = {7'b0000000, in};        // 當Selection為000時
				3'b001 : out = {6'b000000, in, 1'b0};   // 當Selection為001時
				3'b010 : out = {5'b00000, in, 2'b00};   // 當Selection為010時
				3'b011 : out = {4'b0000, in, 3'b000};   // 當Selection為011時
				3'b100 : out = {3'b000, in, 4'b0000};   // 當Selection為100時
				3'b101 : out = {2'b00, in, 5'b00000};   // 當Selection為101時
				3'b110 : out = {1'b0, in, 6'b000000};   // 當Selection為110時
				3'b111 : out = {in, 7'b0000000};        // 當Selection為111時
			endcase
		end
endmodule
