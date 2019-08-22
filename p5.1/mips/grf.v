`ifndef GRF
`define GRF


module grf(
	input [4:0] RAddr1,
	input [4:0] RAddr2,
	input [4:0] WAddr,
	input [31:0] WData,
	input RegWrite,
	input Clk,
	input Reset,
	output [31:0] RData1,
	output [31:0] RData2
    );
	
	reg [31:0] RF [31:1];
	integer i;
	
	assign RData1 = RAddr1 ? 
                	((RAddr1 == WAddr && RegWrite) ? WData : RF[RAddr1]) :
					32'b0;
	assign RData2 = RAddr2 ? 
                	((RAddr2 == WAddr && RegWrite) ? WData : RF[RAddr2]) :
					32'b0;
	
	always @ (posedge Clk) begin
		if (Reset) begin
			for (i = 1; i < 32; i = i + 1) begin
				RF[i] <= 32'b0;
			end
		end
		else if (RegWrite) begin
			$display("$%d <= %h",WAddr,WData);
			if (WAddr) begin
				RF[WAddr] <= WData;
			end
		end
	end
	
	initial begin
		for (i = 1; i < 32; i = i + 1) begin
			RF[i] <= 32'b0;
		end
	end

endmodule


`endif