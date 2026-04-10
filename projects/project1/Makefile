make:
	verilator -sv --timing --trace --binary --top-module testbench 	 single_cycle_top.sv mux2.sv adder.sv branch_unit.sv pc.sv 	 instr_mem.sv regfile.sv imm_gen.sv alu.sv data_mem.sv 	 control_unit.sv testbench.sv instr_parser.sv
