`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2021 07:38:07 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top #(parameter clkDivisions1 = 19) (
           input clk,
           input reset,
           input [15:0] SW, 
           input button_1, 
           input button_2,
           input button_state,
           input test,
           output wire [6:0] a_to_g,
           output wire [3:0] an,
           output wire [3:0] an1,
           output wire dp,
           output reg [1:0] barrelControl, // leds for indicating current direction and operation
           output reg input_state
           );

    reg [15:0] SW_Hold;
    reg [15:0] displayOut;
    wire [15:0] outBarrel;
    reg [15:0] inBarrel;
    reg [3:0] barrelSelect;
    reg [3:0] load_in;
    wire [1:0] out;
    wire state;
    wire q_pulse;  
    reg select;

    initial begin
        select <= 0;
    end
    
    //instantiate modules
    button_top Rotate_shift(.button(button_1), .clk_in(clk), .toggle(out[0]));
    button_top Left_Right(.button(button_2), .clk_in(clk), .toggle(out[1]));
    button_top switch_input(.button(button_state), .clk_in(clk), .toggle(state));
    pulse beta(.clk(clk), .buttonIn(test), .pulse(q_pulse));

   always @(posedge clk)begin
       if (reset) begin
           displayOut = 0;
           select = 0;
       end
       barrelControl <= out;
      case (select)
          0: displayOut = SW;
          1: displayOut = outBarrel;
          default: displayOut = SW;
      endcase
       // when q_pulse (sort of like the trigger/load) input stuff into barrel via SW_Hold and set select to 1
        if (state) begin
            // only loads barrel once with inBarrel and disables 
            if (~select) begin
                //once disabled we have to load the inBarrel with the SW_Hold
                SW_Hold <= SW;
                inBarrel = SW_Hold;
                select = 1; //then this will display out 
            end
            
            if (q_pulse) begin 
                //since we won't press reset yet, we can still press the test button and it should update
                //the barrel in with barrel out so the numbers on the SSD update according. Once reset, can test out different cases.
                inBarrel = outBarrel;
                load_in <= SW;
                            

                //initially, the cases from the rotation are overwritting the shift.
                //since out is 2-bits, created a mux for the barrel select that way it doesn't get overwritten. 
                    case(out)  
                            //shift
                        0: //left 0001 b
                            barrelSelect <= 4'b0001;
                        1: //right 0010
                            barrelSelect <= 4'b0010;
                                //rotate
                        2: //left 0100
                            barrelSelect <= 4'b0100;
                        3: //right 1000
                            barrelSelect <= 4'b1000;
                    endcase
            end
    //display the lEDS on the board -> binary
        //changed the button postion so its easier to see the chagnes between the barrelSelect
        

        end
        
       //update the switches with the values being passed in
end


   ssd #(.clkDivisions(clkDivisions1))display(
   .SW(displayOut), 
   .clk(clk),
   .reset(reset),
   .a_to_g(a_to_g),
   .an(an), 
   .an1(an1),
   .dp(dp)
   );
   
   barrel roll(
           .I(inBarrel),
           .S(barrelSelect), //barrel select would be here
           .S_IN(load_in), // <- need to load this
           .z(outBarrel)
           );

            
endmodule


module pulse(input clk, input buttonIn, output reg pulse); 
    reg pressed;
    initial begin
        pressed <= 0;
    end
   always @ (posedge clk) begin
       if (!pressed && buttonIn) begin 
           pressed <= 1;
           pulse <= 1;
       end
       else begin
           pulse <= 0;
       end
       if (!buttonIn) begin
           pressed <= 0;
       end
   end
endmodule