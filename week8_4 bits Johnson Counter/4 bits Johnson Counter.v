// D-flip flop
module df1(q, d, c);
	output q;
	input d, c;
	reg q;
	always@(posedge c)
	q <= d;
endmodule

// Johnson Counter
module test(q, clk);
	input [3:0]q; // 4bits
	input clk;
	wire w;
	not(w, q[3]);
	df1 f1(q[0], w, clk); // 第一個D-flip flop
	df1 f2(q[1], q[0], clk); // 第二個D-flip flop
	df1 f3(q[2], q[1], clk); // 第三個D-flip flop
	df1 f4(q[3], q[2], clk); // 第四個D-flip flop
endmodule
