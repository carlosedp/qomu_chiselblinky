module Blinky(
  input   clock,
  input   reset,
  output  io_led0,
  output  io_led1,
  output  io_led2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  led; // @[Blinky.scala 15:33]
  reg [23:0] counterWrap_value; // @[Counter.scala 60:40]
  wire  counterWrap_wrap_wrap = counterWrap_value == 24'hbebc1f; // @[Counter.scala 72:24]
  wire [23:0] _counterWrap_wrap_value_T_1 = counterWrap_value + 24'h1; // @[Counter.scala 76:24]
  reg [6:0] io_led2_pwm; // @[Blinky.scala 59:27]
  reg  io_led2_upReg; // @[Blinky.scala 60:27]
  reg [16:0] io_led2_cw_value; // @[Counter.scala 60:40]
  wire  io_led2_cw_wrap_wrap = io_led2_cw_value == 17'h1e847; // @[Counter.scala 72:24]
  wire [16:0] _io_led2_cw_wrap_value_T_1 = io_led2_cw_value + 17'h1; // @[Counter.scala 76:24]
  wire [6:0] _io_led2_pwm_T_1 = io_led2_pwm + 7'h1; // @[Blinky.scala 63:50]
  wire [6:0] _io_led2_pwm_T_3 = io_led2_pwm - 7'h1; // @[Blinky.scala 65:51]
  wire [6:0] _GEN_7 = io_led2_pwm > 7'h0 & ~io_led2_upReg ? _io_led2_pwm_T_3 : io_led2_pwm; // @[Blinky.scala 65:39 Blinky.scala 65:44 Blinky.scala 59:27]
  wire  _GEN_8 = io_led2_pwm > 7'h0 & ~io_led2_upReg ? io_led2_upReg : 1'h1; // @[Blinky.scala 65:39 Blinky.scala 60:27 Blinky.scala 66:26]
  wire  _GEN_9 = io_led2_pwm == 7'h64 & io_led2_upReg ? 1'h0 : _GEN_8; // @[Blinky.scala 64:47 Blinky.scala 64:54]
  wire  _GEN_12 = io_led2_pwm < 7'h64 & io_led2_upReg ? io_led2_upReg : _GEN_9; // @[Blinky.scala 63:38 Blinky.scala 60:27]
  wire  _GEN_14 = io_led2_cw_wrap_wrap ? _GEN_12 : io_led2_upReg; // @[Blinky.scala 62:14 Blinky.scala 60:27]
  reg [9:0] io_led2_clockDiv; // @[Blinky.scala 39:27]
  wire [9:0] _io_led2_clockDiv_T_1 = io_led2_clockDiv + 10'h1; // @[Blinky.scala 40:26]
  reg [6:0] io_led2_cnt; // @[Blinky.scala 41:22]
  reg  io_led2_out; // @[Blinky.scala 42:22]
  wire [6:0] _io_led2_cnt_T_2 = io_led2_cnt + 7'h1; // @[Blinky.scala 44:42]
  assign io_led0 = led; // @[Blinky.scala 21:11]
  assign io_led1 = ~led; // @[Blinky.scala 22:14]
  assign io_led2 = io_led2_out; // @[Blinky.scala 25:11]
  always @(posedge clock) begin
    if (reset) begin // @[Blinky.scala 15:33]
      led <= 1'h0; // @[Blinky.scala 15:33]
    end else if (counterWrap_wrap_wrap) begin // @[Blinky.scala 17:21]
      led <= ~led; // @[Blinky.scala 18:9]
    end
    if (reset) begin // @[Counter.scala 60:40]
      counterWrap_value <= 24'h0; // @[Counter.scala 60:40]
    end else if (counterWrap_wrap_wrap) begin // @[Counter.scala 86:20]
      counterWrap_value <= 24'h0; // @[Counter.scala 86:28]
    end else begin
      counterWrap_value <= _counterWrap_wrap_value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Blinky.scala 59:27]
      io_led2_pwm <= 7'h0; // @[Blinky.scala 59:27]
    end else if (io_led2_cw_wrap_wrap) begin // @[Blinky.scala 62:14]
      if (io_led2_pwm < 7'h64 & io_led2_upReg) begin // @[Blinky.scala 63:38]
        io_led2_pwm <= _io_led2_pwm_T_1; // @[Blinky.scala 63:43]
      end else if (!(io_led2_pwm == 7'h64 & io_led2_upReg)) begin // @[Blinky.scala 64:47]
        io_led2_pwm <= _GEN_7;
      end
    end
    io_led2_upReg <= reset | _GEN_14; // @[Blinky.scala 60:27 Blinky.scala 60:27]
    if (reset) begin // @[Counter.scala 60:40]
      io_led2_cw_value <= 17'h0; // @[Counter.scala 60:40]
    end else if (io_led2_cw_wrap_wrap) begin // @[Counter.scala 86:20]
      io_led2_cw_value <= 17'h0; // @[Counter.scala 86:28]
    end else begin
      io_led2_cw_value <= _io_led2_cw_wrap_value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Blinky.scala 39:27]
      io_led2_clockDiv <= 10'h0; // @[Blinky.scala 39:27]
    end else begin
      io_led2_clockDiv <= _io_led2_clockDiv_T_1; // @[Blinky.scala 40:14]
    end
    if (reset) begin // @[Blinky.scala 41:22]
      io_led2_cnt <= 7'h0; // @[Blinky.scala 41:22]
    end else if (io_led2_clockDiv == 10'h0) begin // @[Blinky.scala 43:28]
      if (io_led2_cnt == 7'h64) begin // @[Blinky.scala 44:17]
        io_led2_cnt <= 7'h0;
      end else begin
        io_led2_cnt <= _io_led2_cnt_T_2;
      end
    end
    if (reset) begin // @[Blinky.scala 42:22]
      io_led2_out <= 1'h0; // @[Blinky.scala 42:22]
    end else if (io_led2_clockDiv == 10'h0) begin // @[Blinky.scala 43:28]
      io_led2_out <= io_led2_pwm > io_led2_cnt; // @[Blinky.scala 45:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  led = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  counterWrap_value = _RAND_1[23:0];
  _RAND_2 = {1{`RANDOM}};
  io_led2_pwm = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  io_led2_upReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_led2_cw_value = _RAND_4[16:0];
  _RAND_5 = {1{`RANDOM}};
  io_led2_clockDiv = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  io_led2_cnt = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  io_led2_out = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Toplevel(
  input   clock,
  input   reset,
  output  io_led0,
  output  io_led1,
  output  io_led2
);
  wire  pll_clki; // @[Toplevel.scala 20:25]
  wire  pll_clko; // @[Toplevel.scala 20:25]
  wire  pll_lock; // @[Toplevel.scala 20:25]
  wire  bl_clock; // @[Toplevel.scala 26:20]
  wire  bl_reset; // @[Toplevel.scala 26:20]
  wire  bl_io_led0; // @[Toplevel.scala 26:20]
  wire  bl_io_led1; // @[Toplevel.scala 26:20]
  wire  bl_io_led2; // @[Toplevel.scala 26:20]
  PLL0 pll ( // @[Toplevel.scala 20:25]
    .clki(pll_clki),
    .clko(pll_clko),
    .lock(pll_lock)
  );
  Blinky bl ( // @[Toplevel.scala 26:20]
    .clock(bl_clock),
    .reset(bl_reset),
    .io_led0(bl_io_led0),
    .io_led1(bl_io_led1),
    .io_led2(bl_io_led2)
  );
  assign io_led0 = bl_io_led0; // @[Toplevel.scala 29:11]
  assign io_led1 = bl_io_led1; // @[Toplevel.scala 29:11]
  assign io_led2 = bl_io_led2; // @[Toplevel.scala 29:11]
  assign pll_clki = clock; // @[Toplevel.scala 21:15]
  assign bl_clock = pll_clko;
  assign bl_reset = reset; // @[Toplevel.scala 12:25 Toplevel.scala 16:17]
endmodule
