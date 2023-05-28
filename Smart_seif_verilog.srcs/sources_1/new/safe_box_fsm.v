`timescale 1ns / 1ps

module safe_box_fsm(
                    input clk,
                    input rst,
                    input valid_password,
                    input [11:0] password,
                    output detect_ok
                   );
                   
localparam WAIT_PASSWORD = 3'b000;
localparam CHECK_CODE = 3'b001;
localparam RIGHT_CODE = 3'b010;
localparam WRONG_CODE = 3'b100;
localparam STOP = 3'b011;

reg [2:0] state, next_state;
reg [2:0] counter;
reg counter_clear;

always@(posedge clk) begin
    if(rst == 1)
        state <= WAIT_PASSWORD;
    else
        state <= next_state;
end

always@(posedge clk) begin
    if(state == WRONG_CODE)
        counter = counter + 1;
    else if(counter_clear == 1)
        counter = 3'd0;
end

always@(*)
begin

    next_state = state;
    counter_clear = 0;
    
    case(state)
            WAIT_PASSWORD: begin
                               if(valid_password == 1) next_state = CHECK_CODE;
                           end
            CHECK_CODE:    begin
                               if((valid_password == 1)&&(password == 12'd3948))
                               begin 
                               next_state = RIGHT_CODE;
                               end else
                               begin
                               next_state = WRONG_CODE;
                               end
                           end
            RIGHT_CODE:    begin
                               if(valid_password == 0) next_state = WAIT_PASSWORD;
                               counter_clear = 1;
                           end
            WRONG_CODE:    begin
                               if(counter == 3'd3) 
                               begin
                               next_state = STOP;
                               end else
                               begin
                               next_state = WAIT_PASSWORD;
                               end
                           end
            STOP:          begin
                               next_state = STOP;
                           end
            default: next_state = WAIT_PASSWORD;
    endcase
end

assign detect_ok = (state == CHECK_CODE)||(state == RIGHT_CODE);

endmodule
