// Code generated by Icestudio 0.5.1w210224

`default_nettype none

//---- Top entity
module main #(
 parameter v1408f0 = 8
) (
 input vb286ce,
 input v9de9d9,
 input v8cc021,
 output [7:0] v9afc5b,
 output v6f32c9,
 output v278cff,
 output v749246
);
 localparam p3 = v1408f0;
 wire w0;
 wire [0:7] w1;
 wire w2;
 wire w4;
 wire w5;
 wire w6;
 wire w7;
 wire w8;
 wire w9;
 wire w10;
 wire w11;
 wire w12;
 wire [0:7] w13;
 wire w14;
 wire w15;
 wire w16;
 wire w17;
 wire w18;
 assign w0 = v8cc021;
 assign v9afc5b = w1;
 assign v6f32c9 = w2;
 assign w10 = v8cc021;
 assign v278cff = w11;
 assign v749246 = w12;
 assign w14 = v9de9d9;
 assign w15 = v9de9d9;
 assign w16 = vb286ce;
 assign w17 = vb286ce;
 assign w8 = w7;
 assign w9 = w7;
 assign w9 = w8;
 assign w10 = w0;
 assign w15 = w14;
 assign w17 = w16;
 v862d2a vce6671 (
  .v608bd9(w7)
 );
 v83e08e #(
  .v980c02(p3)
 ) vb6fde8 (
  .v141acd(w4),
  .v49c920(w5),
  .v7d3cb4(w6),
  .v48c7aa(w7),
  .v5ed28b(w8),
  .v31eb2a(w9),
  .vd421f3(w10),
  .vb1496e(w11),
  .v0e813c(w12),
  .v06c25a(w13),
  .ve17a61(w15),
  .v962873(w17),
  .v0c3884(w18)
 );
 main_v107d31 v107d31 (
  .MISO(w0),
  .leds(w1),
  .SSBar(w2),
  .start(w4),
  .busy_spi(w5),
  .ack(w6),
  .data_spi(w13),
  .rst(w14),
  .clk(w16),
  .ena_2clk(w18)
 );
endmodule

/*-------------------------------------------------*/
/*--   */
/*-- - - - - - - - - - - - - - - - - - - - - - - --*/
/*-- 
/*-------------------------------------------------*/
//---- Top entity
module v862d2a (
 output v608bd9
);
 wire w0;
 assign v608bd9 = w0;
 v862d2a_v68c173 v68c173 (
  .v(w0)
 );
endmodule

/*-------------------------------------------------*/
/*-- Bit 0  */
/*-- - - - - - - - - - - - - - - - - - - - - - - --*/
/*-- Assign 0 to the output wire
/*-------------------------------------------------*/

module v862d2a_v68c173 (
 output v
);
 // Bit 0
 
 assign v = 1'b0;
endmodule
//---- Top entity
module v83e08e #(
 parameter v980c02 = 8
) (
 input v962873,
 input ve17a61,
 input v0c3884,
 input v141acd,
 input [7:0] v06c25a,
 input v7d3cb4,
 input v48c7aa,
 input v5ed28b,
 input v31eb2a,
 input vd421f3,
 output [7:0] v9841fd,
 output v49c920,
 output v03edbc,
 output vb1496e,
 output v4cf0a5,
 output v0e813c
);
 localparam p10 = v980c02;
 wire w0;
 wire w1;
 wire w2;
 wire w3;
 wire [0:7] w4;
 wire w5;
 wire w6;
 wire w7;
 wire w8;
 wire w9;
 wire w11;
 wire [0:7] w12;
 wire w13;
 wire w14;
 wire w15;
 wire w16;
 assign w0 = v962873;
 assign w1 = ve17a61;
 assign w2 = v0c3884;
 assign w3 = v141acd;
 assign w4 = v06c25a;
 assign w5 = v7d3cb4;
 assign w6 = v48c7aa;
 assign w7 = v5ed28b;
 assign w8 = v31eb2a;
 assign w9 = vd421f3;
 assign v49c920 = w11;
 assign v9841fd = w12;
 assign v0e813c = w13;
 assign v4cf0a5 = w14;
 assign vb1496e = w15;
 assign v03edbc = w16;
 v83e08e_vf6a642 #(
  .DATA_W(p10)
 ) vf6a642 (
  .clk_i(w0),
  .rst_i(w1),
  .ena_i(w2),
  .start_i(w3),
  .tx_i(w4),
  .ack_i(w5),
  .cpo_i(w6),
  .dord_i(w7),
  .cpha_i(w8),
  .miso_i(w9),
  .busy_o(w11),
  .rx_o(w12),
  .mosi_o(w13),
  .mosi_en_o(w14),
  .sclk_o(w15),
  .irq_o(w16)
 );
endmodule

/*-------------------------------------------------*/
/*--   */
/*-- - - - - - - - - - - - - - - - - - - - - - - --*/
/*-- 
/*-------------------------------------------------*/

module v83e08e_vf6a642 #(
 parameter DATA_W = 0
) (
 input clk_i,
 input rst_i,
 input ena_i,
 input start_i,
 input [7:0] tx_i,
 input ack_i,
 input cpo_i,
 input dord_i,
 input cpha_i,
 input miso_i,
 output [7:0] rx_o,
 output busy_o,
 output irq_o,
 output sclk_o,
 output mosi_en_o,
 output mosi_o
);
 /***********************************************************************
 
   SPI Master
 
   This file is part FPGA Libre project http://fpgalibre.sf.net/
 
   Description:
   Configurable Master Serial Protocol Interface controller.
   This is different than SPI_controller:
   - Modes can be configured with signals, not just generics.
   - The SS logic is left to the upper level.
   - We always return to IDLE before transmitting again.
   - IMPORTANT! assumes that start_i resets the ena_i generator. In
     this way start_i can last 1 clock cycle (no need to wait for
     busy_o to become 1).
 
   To Do:
   -
 
   Author:
     - Salvador E. Tropea, salvador en inti gob ar
 
 ------------------------------------------------------------------------------
 
  Copyright (c) 2017 Salvador E. Tropea <salvador en inti gob ar>
  Copyright (c) 2017 Instituto Nacional de Tecnología Industrial
 
  Distributed under the GPL v2 or newer license
 
 ------------------------------------------------------------------------------
 
  Design unit:      SPI_Master(RTL) (Entity and architecture)
  File name:        spi_master.v
  Note:             None
  Limitations:      None known
  Errors:           None known
  Library:          None
  Dependencies:     IEEE.std_logic_1164
                    IEEE.numeric_std
  Target FPGA:
  Language:         Verilog
  Wishbone:         None
  Synthesis tools:
  Simulation tools: GHDL [Sokcho edition] (0.2x)
  Text editor:      SETEdit 0.5.x
 
 ***********************************************************************/
 //localparam integer CNT_BITS=$clog2(DATA_W);
 localparam integer CNT_BITS=3;
 localparam IDLE=0, LEADING_SCLK=1, TRAILING_SCLK=2, STOP=3; // state_t
 
 reg  [DATA_W-1:0] reg_r=0;
 reg  sclk_r=0;
 wire  sclk_o=0;
 reg  [CNT_BITS-1:0] bit_cnt=0;
 reg  [1:0] state=IDLE; // states for shifter_FSM.
 reg  miso_r; // Sampled MISO
 reg  irq_o;
 
 always @(posedge clk_i)
 begin : shifter_FSM
   if (rst_i)
      begin
      state  <= IDLE;
      sclk_r <= 0;
      irq_o  <= 0;
      end
   else
      begin
      if (ack_i)
         irq_o <= 0;
      case (state)
         IDLE:
           if (start_i) // init transaction
              begin
              state   <= LEADING_SCLK;
              reg_r   <= tx_i;
              bit_cnt <= 0;
              end
         LEADING_SCLK:
           if (ena_i)
              begin
              state  <= TRAILING_SCLK;
              sclk_r <= !sclk_r;
              if (!cpha_i) // Leading sample
                 miso_r <= miso_i;
              end
         TRAILING_SCLK:
           if (ena_i)
              begin
              sclk_r <= !sclk_r;
              if (bit_cnt==DATA_W-1)
                 begin
                 state <= STOP;
                 bit_cnt <= 0;
                 end
              else
                 begin
                 state <= LEADING_SCLK;
                 bit_cnt <= bit_cnt+1;
                 end
              if (cpha_i) // Leading sample
                 miso_r <= miso_i;
              end
         default: // STOP
           // Maintain the last bit for half the clock to finish
           // If we don't do it we could violate the slave hold time
           if (ena_i)
              begin
              irq_o <= 1;
              state <= IDLE;
              end
      endcase
      // Shift in cases
      if (ena_i)
         if (  (state==TRAILING_SCLK && !cpha_i) ||
             (((state==LEADING_SCLK && bit_cnt) || state==STOP) && cpha_i))
            begin
            // Shift
            if (dord_i)
               // Right
               reg_r <= {miso_r,reg_r[DATA_W-1:1]};
            else
               // Left
               reg_r <= {reg_r[DATA_W-2:0],miso_r};
            end
      end // !rst_i
 end // shifter_FSM
 
 // The FSM generates CPOL=0, if CPOL is 1 we just invert
 assign sclk_o=clk_i;
 // MOSI takes the LSB or MSB according to DORD
 assign mosi_o=dord_i ? reg_r[0] : reg_r[DATA_W-1];
 assign mosi_en_o=state!=IDLE;
 assign rx_o=reg_r;
 assign busy_o=state!=IDLE;
 
endmodule

module main_v107d31 (
 input rst,
 input clk,
 input MISO,
 input [7:0] data_flash,
 input busy_spi,
 output [7:0] leds,
 output SCLK,
 output MOSI,
 output SSBar,
 output start,
 output ack,
 output ena_2clk,
 output [7:0] data_spi
);
 // @include spi_ledctrl.v
 
 spi_ledctrl i_spi_ledctrl
 (
   .rst         (rst),
   .clk         (clk),
   //.MISO        (MISO),
   //.data_flash  (data_flash),
   .busy_spi    (busy_spi),
   .leds        (leds),
   //.SCLK        (SCLK),
   //.MOSI        (MOSI),
   .SSBar       (SSBar),
   .start       (start),
   .data_spi    (data_spi),
   .ack         (ack)
 );
endmodule
