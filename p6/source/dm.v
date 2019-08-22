`ifndef DM
`define DM


module dm(
	input Clk,
	input Reset,
	input [31:0] Addr,
	input [31:0] WData,
	input MemWrite,
	input [2:0] MemWOp,
	output [31:0] RData
    );

	reg [31:0] _dm [2047:0];
	integer i;
	
	assign RData = _dm[Addr[12:2]];
	
	always @ (posedge Clk) begin
		if (Reset) begin
			for (i = 0; i < 2048; i = i + 1) begin
				_dm[i] <= 32'b0;
			end
		end
		else if (MemWrite) begin
			case (MemWOp) 
				3'b 000 : begin
					_dm[Addr[12:2]] <= WData;
					$display("*%h <= %h",Addr,WData);
				end
				3'b 001 : begin
					case (Addr[1:0])
						2'b 00 : _dm[Addr[12:2]][15:0]  <= WData[15:0];
						2'b 10 : _dm[Addr[12:2]][31:16] <= WData[15:0];
					endcase
					$display("*%h <= %h", Addr, WData[15:0]);
				end
				3'b 010 : begin
					case (Addr[1:0])
						2'b 00 : _dm[Addr[12:2]][7:0]   <= WData[7:0];
						2'b 01 : _dm[Addr[12:2]][15:8]  <= WData[7:0];
						2'b 10 : _dm[Addr[12:2]][23:16] <= WData[7:0];
						2'b 11 : _dm[Addr[12:2]][31:24] <= WData[7:0];
					endcase
					$display("*%h <= %h", Addr, WData[7:0]);
				end
				3'b 011 : begin
					case (Addr[1:0])
						2'b 00 :  begin
							_dm[Addr[12:2]][7:0]  <= WData[31:24]; 
							$display("*%h <= %h", {Addr[31:2], 2'b00}, WData[31:24]);
						end
						2'b 01 : begin
							_dm[Addr[12:2]][15:0] <= WData[31:16];
							$display("*%h <= %h", {Addr[31:2], 2'b00}, WData[31:16]);
						end
						2'b 10 : begin
							_dm[Addr[12:2]][23:0] <= WData[31:8];
							$display("*%h <= %h", {Addr[31:2], 2'b00}, WData[31:8]);
						end
						2'b 11 : begin
							_dm[Addr[12:2]][31:0] <= WData[31:0];
							$display("*%h <= %h", {Addr[31:2], 2'b00}, WData[31:0]);
						end
					endcase
				end
				3'b 100 : begin
					case (Addr[1:0])
						2'b 00 : begin
							_dm[Addr[12:2]][31:0]  <= WData[31:0];
							$display("*%h <= %h", Addr, WData[31:0]);
						end
						2'b 01 : begin
							_dm[Addr[12:2]][31:8]  <= WData[23:0];
							$display("*%h <= %h", Addr, WData[23:0]);
						end
						2'b 10 : begin
							_dm[Addr[12:2]][31:16] <= WData[15:0];
							$display("*%h <= %h", Addr, WData[15:0]);
						end
						2'b 11 : begin
							_dm[Addr[12:2]][31:24] <= WData[7:0];
							$display("*%h <= %h", Addr, WData[7:0]);
						end
					endcase
				end
			endcase
		end
	end
	
	initial begin
		for (i = 0; i < 2048; i = i + 1) begin
			_dm[i] <= 32'b0;
		end
	end

endmodule


`endif
