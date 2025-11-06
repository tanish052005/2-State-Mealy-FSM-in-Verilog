This project implements a 2-state Mealy Finite State Machine (FSM) in Verilog.
The design uses input, clock, and reset signals to generate an output that depends on both the current state and the input.
Simulation is performed in ModelSim to verify correct transitions and Mealy behavior.

Explanation
1.Two States: The FSM operates in S0 and S1, switching based on the input signal.
2.Output Logic: Output changes instantly with input variations, confirming Mealy machine properties.
3.Clock and Reset: State updates occur on the rising edge of the clock, while reset returns the FSM to S0.
4.Simulation Tool: ModelSim is used to visualize waveform behavior for clk, reset, in, and out.
5.Verification: The waveform confirms correct state transitions and expected output responses.

