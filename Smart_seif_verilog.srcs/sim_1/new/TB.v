`timescale 1ns / 1ps

module TB();

reg clk_t;
reg rst_t;
reg valid_password_t;
reg [11:0] password_t;
wire detect_ok_t;

safe_box_fsm DUT(
                .clk(clk_t),
                .rst(rst_t),
                .valid_password(valid_password_t),
                .password(password_t),
                .detect_ok(detect_ok_t)
                );
               
initial begin
      clk_t = 0;
      forever #1 clk_t = ~clk_t;
end

initial begin
      rst_t=1;
      valid_password_t=0;
      password_t=12'd0;
    #2
      rst_t=0;
    #10
      valid_password_t = 1;
      password_t = 12'd3948;
    #10
      valid_password_t = 1;
      password_t = 12'd3948;
    #10
      valid_password_t = 0;
      password_t = 12'd3948;
    #10
      valid_password_t = 1;
      password_t = 12'd3948;
    #10
     valid_password_t = 1;
     password_t = 12'd3948;
    #10
      valid_password_t = 0;
      password_t = 12'd3948;
    #10
      valid_password_t = 1;
      password_t = 12'd3948;
    #10
      valid_password_t = 1;
      password_t = 12'd3948;
    #10
      valid_password_t = 0;
      password_t = 12'd3948;
    #10
      valid_password_t = 1;
      password_t = 12'd3948;
    #10
      valid_password_t = 0;
      password_t = 12'd3948;
      
    #50
      valid_password_t = 1;
      password_t = 12'd1111;
    #10
      valid_password_t = 1;
      password_t = 12'd1111;
    #10
      valid_password_t = 0;
      password_t = 12'd1111;
    #10
      valid_password_t = 1;
      password_t = 12'd1111;
    #10
     valid_password_t = 1;
     password_t = 12'd1111;
    #10
      valid_password_t = 0;
      password_t = 12'd1111;
    #10
      valid_password_t = 1;
      password_t = 12'd1111;
    #10
      valid_password_t = 1;
      password_t = 12'd1111;
    #10
      valid_password_t = 0;
      password_t = 12'd1111;
    #10
      valid_password_t = 1;
      password_t = 12'd1111;
    #10
      valid_password_t = 0;
      password_t = 12'd1111;
    
    #10 $stop();

end
endmodule
