`ifndef DM
`define DM


module dm(
	input [31:0] Addr,
	input [31:0] WData,
	input MemWrite,
	input Clk,
	input Reset,
	output [31:0] RData
    );

	reg [31:0] _dm [1023:0];
	integer i;
	
	assign RData = _dm[Addr[11:2]];
	
	always @ (posedge Clk) begin
		if (Reset) begin
			for (i = 0; i < 1024; i = i + 1) begin
				_dm[i] <= 32'b0;
			end
		end
		else if (MemWrite) begin
			_dm[Addr[11:2]] <= WData;
			$display("*%h <= %h",Addr,WData);
		end
	end
	
	initial begin
		for (i = 0; i < 1024; i = i + 1) begin
			_dm[i] <= 32'b0;
		end
	end

endmodule


`endif
