module mux (input wire [7:0] in1, in2, 
            input wire sel,
            output wire [7:0] out);
  
  assign out = sel ? in1 : in2;
  
endmodule
