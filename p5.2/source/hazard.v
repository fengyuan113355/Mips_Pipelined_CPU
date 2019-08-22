`timescale 1ns / 1ps
`ifndef HAZARD
`define HAZARD

`include "signal_def.v"

module stall(
	input [31:0] FD_Instr,
	input [31:0] DE_Instr,
	input [31:0] EM_Instr,
	output StallPC,
	output StallFD,
	output FlushDE
    );

	wire isStall, Stall_rs, Stall_rt;

	wire FD_beq, FD_jr, FD_cal_r, FD_cal_i, FD_load, FD_store;
	wire DE_cal_r, DE_cal_i, DE_load;
	wire EM_load;
	
	wire Stall_beq_rs, Stall_beq_rt, Stall_jr_rs, 
		 Stall_cal_r_rs, Stall_cal_r_rt, Stall_cal_i_rs, 
		 Stall_load_rs, Stall_store_rs;		 
	
	
	assign StallPC = isStall;
	assign StallFD = isStall;
	assign FlushDE = isStall;
	
	
	assign FD_beq = (FD_Instr[`op] == `BEQ_OP);
	assign FD_jr = (FD_Instr[`op] == `R_OP) &
	               (FD_Instr[`funct] == `JR_FUNCT);
	assign FD_cal_r = (FD_Instr[`op] == `R_OP) &
				   ((FD_Instr[`funct] == `ADDU_FUNCT) |
					(FD_Instr[`funct] == `SUBU_FUNCT));
	assign FD_cal_i = (FD_Instr[`op] == `ORI_OP) |
					  (FD_Instr[`op] == `LUI_OP);
	assign FD_load = (FD_Instr[`op] == `LW_OP);
	assign FD_store = (FD_Instr[`op] == `SW_OP);
					 	 
	assign DE_cal_r = (DE_Instr[`op] == `R_OP) &
				   ((DE_Instr[`funct] == `ADDU_FUNCT) |
					(DE_Instr[`funct] == `SUBU_FUNCT));
	assign DE_cal_i = (DE_Instr[`op] == `ORI_OP) |
					  (DE_Instr[`op] == `LUI_OP);
	assign DE_load = (DE_Instr[`op] == `LW_OP);
	
	assign EM_load = (EM_Instr[`op] == `LW_OP);
	
	
	assign Stall_beq_rs = FD_beq & ((DE_cal_r & (FD_Instr[`rs] == DE_Instr[`rd])) |
							        (DE_cal_i & (FD_Instr[`rs] == DE_Instr[`rt])) |
							        (DE_load & (FD_Instr[`rs] == DE_Instr[`rt])) |
							        (EM_load & (FD_Instr[`rs] == EM_Instr[`rt])));
	assign Stall_beq_rt = FD_beq & ((DE_cal_r & (FD_Instr[`rt] == DE_Instr[`rd])) |			 
									(DE_cal_i & (FD_Instr[`rt] == DE_Instr[`rt])) |
					                (DE_load & (FD_Instr[`rt] == DE_Instr[`rt])) |
					                (EM_load & (FD_Instr[`rt] == EM_Instr[`rt])));
	assign Stall_jr_rs =   FD_jr & ((DE_cal_r & (FD_Instr[`rs] == DE_Instr[`rd])) |
							        (DE_cal_i & (FD_Instr[`rs] == DE_Instr[`rt])) |
							        (DE_load & (FD_Instr[`rs] == DE_Instr[`rt])) |
							        (EM_load & (FD_Instr[`rs] == EM_Instr[`rt])));
	assign Stall_cal_r_rs = FD_cal_r & DE_load  & (FD_Instr[`rs] == DE_Instr[`rt]);				 
	assign Stall_cal_r_rt = FD_cal_r & DE_load  & (FD_Instr[`rt] == DE_Instr[`rt]);
	assign Stall_cal_i_rs = FD_cal_i & DE_load  & (FD_Instr[`rs] == DE_Instr[`rt]);				 
	assign Stall_load_rs = FD_load & DE_load  & (FD_Instr[`rs] == DE_Instr[`rt]);
	assign Stall_store_rs = FD_store & DE_load  & (FD_Instr[`rs] == DE_Instr[`rt]);
	
	
	assign Stall_rs = (FD_Instr[`rs] != 0) & 
					  (Stall_beq_rs | Stall_cal_r_rs | Stall_cal_i_rs | Stall_jr_rs |
					   Stall_load_rs | Stall_store_rs);
	assign Stall_rt = (FD_Instr[`rt] != 0) &
					  (Stall_beq_rt | Stall_cal_r_rt);
	assign isStall = Stall_rs | Stall_rt;
					 
endmodule

module Bypass(
	input [31:0] FD_Instr,
	input [31:0] DE_Instr,
	input [31:0] EM_Instr,
	input [31:0] MW_Instr,
	output [1:0] BypassDrs,
	output [1:0] BypassDrt,
	output [2:0] BypassErs,
	output [2:0] BypassErt,
	output [1:0]BypassMrt
	);
	
	reg [1:0] _BypassDrs, _BypassDrt;
	reg [2:0] _BypassErs, _BypassErt;
	reg [1:0] _BypassMrt;
	
	assign BypassDrs = _BypassDrs;
	assign BypassDrt = _BypassDrt;
	assign BypassErs = _BypassErs;
	assign BypassErt = _BypassErt;
	assign BypassMrt = _BypassMrt;
	
	wire FD_beq, FD_jr;
	wire DE_cal_r, DE_cal_i, DE_load, DE_store, DE_jal;
	wire EM_store, EM_cal_r, EM_cal_i, EM_jal;
	wire MW_cal_r, MW_cal_i, MW_load, MW_jal;
	
	
	assign FD_beq =   (FD_Instr[`op] == `BEQ_OP);
	assign FD_jr =    (FD_Instr[`op] == `R_OP) & 
	                  (FD_Instr[`funct] == `JR_FUNCT);
					 	 
	assign DE_cal_r = (DE_Instr[`op] == `R_OP) &
				     ((DE_Instr[`funct] == `ADDU_FUNCT) |
					  (DE_Instr[`funct] == `SUBU_FUNCT));
	assign DE_cal_i = (DE_Instr[`op] == `ORI_OP) |
					  (DE_Instr[`op] == `LUI_OP);
	assign DE_load =  (DE_Instr[`op] == `LW_OP);
	assign DE_store = (DE_Instr[`op] == `SW_OP);
	assign DE_jal =   (DE_Instr[`op] == `JAL_OP);
	
	assign EM_store = (EM_Instr[`op] == `SW_OP);
	assign EM_cal_r = (EM_Instr[`op] == `R_OP) &
				     ((EM_Instr[`funct] == `ADDU_FUNCT) |
					  (EM_Instr[`funct] == `SUBU_FUNCT));
	assign EM_cal_i = (EM_Instr[`op] == `ORI_OP) |
					  (EM_Instr[`op] == `LUI_OP);
	assign EM_jal =   (EM_Instr[`op] == `JAL_OP);
	
	assign MW_cal_r = (MW_Instr[`op] == `R_OP) &
				     ((MW_Instr[`funct] == `ADDU_FUNCT) |
					  (MW_Instr[`funct] == `SUBU_FUNCT));
	assign MW_cal_i = (MW_Instr[`op] == `ORI_OP) |
					  (MW_Instr[`op] == `LUI_OP);
	assign MW_load =  (MW_Instr[`op] == `LW_OP);				 
	assign MW_jal =   (MW_Instr[`op] == `JAL_OP);
	
	
	
	always @ (*) begin
		if ((FD_beq | FD_jr) & (FD_Instr[`rs] != 5'b0)) begin
			if (DE_jal & (FD_Instr[`rs] == 5'h1f))
				_BypassDrs = 2'b01;
			else if ((EM_cal_r & (FD_Instr[`rs] == EM_Instr[`rd])) |
					 (EM_cal_i & (FD_Instr[`rs] == EM_Instr[`rt])))
				_BypassDrs = 2'b10;
			else if (EM_jal & (FD_Instr[`rs] == 5'h1f))
				_BypassDrs = 2'b11;
			else 
				_BypassDrs = 2'b00;
		end
		else
			_BypassDrs = 2'b00;
	end
	
	always @ (*) begin
		if (FD_beq & (FD_Instr[`rt] != 5'b0)) begin
			if (DE_jal & (FD_Instr[`rt] == 5'b0))
				_BypassDrt = 2'b01;
			else if ((EM_cal_r & (FD_Instr[`rt] == EM_Instr[`rd])) |
					 (EM_cal_i & (FD_Instr[`rt] == EM_Instr[`rt])))
				_BypassDrt = 2'b10;
			else if (EM_jal & (FD_Instr[`rt] == 5'h1f))
				_BypassDrt = 2'b11;
			else 
				_BypassDrt = 2'b00;
		end
		else
			_BypassDrt = 2'b00;
	end
					 
	always @ (*) begin
		if ((DE_cal_r | DE_cal_i | DE_load | DE_store) & (DE_Instr[`rs] != 5'b0)) begin
			if ((EM_cal_r & (DE_Instr[`rs] == EM_Instr[`rd])) |
				(EM_cal_i & (DE_Instr[`rs] == EM_Instr[`rt])))
				_BypassErs = 3'b001;
			else if (EM_jal & (DE_Instr[`rs] == 5'h1f))
				_BypassErs = 3'b010;
			else if ((MW_cal_r & (DE_Instr[`rs] == MW_Instr[`rd])) |
					 (MW_cal_i & (DE_Instr[`rs] == MW_Instr[`rt])))
				_BypassErs = 3'b011;
			else if (MW_load & (DE_Instr[`rs] == MW_Instr[`rt]))
				_BypassErs = 3'b100;
			else if (MW_jal & (DE_Instr[`rs] == 5'h1f))
				_BypassErs = 3'b101;
			else 
				_BypassErs = 3'b000;
		end
		else 
			_BypassErs = 3'b000;
	end
	
	always @ (*) begin
		if ((DE_cal_r | DE_store) & (DE_Instr[`rt] != 5'b0)) begin
			if ((EM_cal_r & (DE_Instr[`rt] == EM_Instr[`rd])) |
				(EM_cal_i & (DE_Instr[`rt] == EM_Instr[`rt])))
				_BypassErt = 3'b001;
			else if (EM_jal & (DE_Instr[`rt] == 5'h1f))
				_BypassErt = 3'b010;
			else if ((MW_cal_r & (DE_Instr[`rt] == MW_Instr[`rd])) |
					 (MW_cal_i & (DE_Instr[`rt] == MW_Instr[`rt])))
				_BypassErt = 3'b011;
			else if (MW_load & (DE_Instr[`rt] == MW_Instr[`rt]))
				_BypassErt = 3'b100;
			else if (MW_jal & (DE_Instr[`rt] == 5'h1f))
				_BypassErt = 3'b101;
			else 
				_BypassErt = 3'b000;
		end
		else
			_BypassErt = 3'b000;
	end
	
	always @ (*) begin
		if (EM_store & (EM_Instr[`rt] != 5'b0)) begin
			if ((MW_cal_r & (EM_Instr[`rt] == MW_Instr[`rd])) |
				(MW_cal_i & (EM_Instr[`rt] == MW_Instr[`rt])))
				_BypassMrt = 2'b01;
			else if (MW_load & (EM_Instr[`rt] == MW_Instr[`rt]))
				_BypassMrt = 2'b10;
			else if (MW_jal & (EM_Instr[`rt] == 5'h1f))
				_BypassMrt = 2'b11;
			else 
				_BypassMrt = 2'b00;
		end
		else 
			_BypassMrt = 2'b00;
	end
	
	
endmodule



`endif























