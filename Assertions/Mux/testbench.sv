module mux_tb;
  reg [7:0] in1, in2;
  reg  sel;
  wire [7:0] out;
  
  mux mux_inst (.in1(in1), .in2(in2), .sel(sel), .out(out));
  
  always @(posedge sel) begin
    assert (out == in1) else $error("IN1 is not asserted when sel is high");
  end
  
  always @(negedge sel) begin
    assert (out == in2) else $error("IN2 is not asserted when sel is high");
  end
  
  initial begin
    $dumpfile("mux_dump.vcd");
    $dumpvars;
    #5;
    in1 = 'b0101; // 5
    in2 = 'b0110; // 6
    sel = 1;
    #5;
    assert (out == in1) else $error("IN1 is not asserted when sel is high");

    #5;
    in1 = 'b0101; //5
    in2 = 'b0110; //6
    sel = 0;
    
    #5;
    assert (out == in2) else $display("IN1 is not asserted when sel is low - Passed");

    #5;
    in1 = 'b0101; // 5
    in2 = 'b0110; // 6
    sel = 1;
    #5;
    in1 = 'b0101; //5
    in2 = 'b0110; //6
    sel = 0;
    #10;
    #10;
    $finish;
  end
endmodule