module mealy(input clk, input reset, input in, output reg out);
  
  reg state, nextstate;
  parameter S0 = 0, S1 = 1;   // state encoding

  // Sequential Block: State Update
  always @(posedge clk or posedge reset)
  begin
    if (reset)
      state <= S0;
    else
      state <= nextstate;
  end

  // Combinational Block: Next State and Output Logic
  always @(state or in)
  begin
    case (state)
      S0: if (in)
          begin
            out = 1;
            nextstate = S1;
          end
          else
          begin
            out = 0;
            nextstate = S0;
          end

      S1: if (in)
          begin
            out = 0;
            nextstate = S0;
          end
          else
          begin
            out = 1;
            nextstate = S1;
          end

      default: nextstate = S0;
    endcase
  end

endmodule

module tb_mealy;
  reg clk, reset, in;
  wire out;
  mealy uut (.clk(clk), .reset(reset), .in(in), .out(out));

  initial begin
    clk = 0; forever #5 clk = ~clk;   // 10 ns clock
  end

  initial begin
    reset = 1; in = 0;
    #10 reset = 0;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #20 $finish;
  end
endmodule
