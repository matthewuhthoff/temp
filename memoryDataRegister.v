

module memoryDataRegister(
	input wire clear, wire clock, wire mdrIN, wire read, [31:0] busMuxOut, [31:0] MdataIn,
	output q);

	multiplexer_2_1 mux(busMuxOut, MdataIn, read, muxOut);
	register mdr(clear, clock, mdrIN, muxOut, q);

endmodule

