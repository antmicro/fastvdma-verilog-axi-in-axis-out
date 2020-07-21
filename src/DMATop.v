module AXI4LiteCSR( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_ctl_aw_awaddr, // @[:@6.4]
  input         io_ctl_aw_awvalid, // @[:@6.4]
  output        io_ctl_aw_awready, // @[:@6.4]
  input  [31:0] io_ctl_w_wdata, // @[:@6.4]
  input         io_ctl_w_wvalid, // @[:@6.4]
  output        io_ctl_w_wready, // @[:@6.4]
  output        io_ctl_b_bvalid, // @[:@6.4]
  input         io_ctl_b_bready, // @[:@6.4]
  input  [31:0] io_ctl_ar_araddr, // @[:@6.4]
  input         io_ctl_ar_arvalid, // @[:@6.4]
  output        io_ctl_ar_arready, // @[:@6.4]
  output [31:0] io_ctl_r_rdata, // @[:@6.4]
  output        io_ctl_r_rvalid, // @[:@6.4]
  input         io_ctl_r_rready, // @[:@6.4]
  output [3:0]  io_bus_addr, // @[:@6.4]
  output [31:0] io_bus_dataOut, // @[:@6.4]
  input  [31:0] io_bus_dataIn, // @[:@6.4]
  output        io_bus_write, // @[:@6.4]
  output        io_bus_read // @[:@6.4]
);
  reg [2:0] state; // @[AXI4LiteCSR.scala 39:22:@8.4]
  reg [31:0] _RAND_0;
  reg  awready; // @[AXI4LiteCSR.scala 41:24:@9.4]
  reg [31:0] _RAND_1;
  reg  wready; // @[AXI4LiteCSR.scala 42:23:@10.4]
  reg [31:0] _RAND_2;
  reg  bvalid; // @[AXI4LiteCSR.scala 43:23:@11.4]
  reg [31:0] _RAND_3;
  reg  arready; // @[AXI4LiteCSR.scala 46:24:@14.4]
  reg [31:0] _RAND_4;
  reg  rvalid; // @[AXI4LiteCSR.scala 47:23:@15.4]
  reg [31:0] _RAND_5;
  reg [31:0] addr; // @[AXI4LiteCSR.scala 50:21:@18.4]
  reg [31:0] _RAND_6;
  reg  read; // @[AXI4LiteCSR.scala 52:21:@19.4]
  reg [31:0] _RAND_7;
  reg  write; // @[AXI4LiteCSR.scala 53:22:@20.4]
  reg [31:0] _RAND_8;
  reg [31:0] wdata; // @[AXI4LiteCSR.scala 55:22:@21.4]
  reg [31:0] _RAND_9;
  wire  _T_116; // @[Conditional.scala 37:30:@34.4]
  wire [3:0] _T_117; // @[AXI4LiteCSR.scala 77:33:@38.8]
  wire [3:0] _T_119; // @[AXI4LiteCSR.scala 82:33:@45.10]
  wire [2:0] _GEN_0; // @[AXI4LiteCSR.scala 80:36:@43.8]
  wire [31:0] _GEN_1; // @[AXI4LiteCSR.scala 80:36:@43.8]
  wire  _GEN_2; // @[AXI4LiteCSR.scala 80:36:@43.8]
  wire [2:0] _GEN_3; // @[AXI4LiteCSR.scala 75:30:@36.6]
  wire [31:0] _GEN_4; // @[AXI4LiteCSR.scala 75:30:@36.6]
  wire  _GEN_5; // @[AXI4LiteCSR.scala 75:30:@36.6]
  wire  _GEN_6; // @[AXI4LiteCSR.scala 75:30:@36.6]
  wire  _T_121; // @[Conditional.scala 37:30:@51.6]
  wire  _T_122; // @[AXI4LiteCSR.scala 87:30:@53.8]
  wire [2:0] _GEN_7; // @[AXI4LiteCSR.scala 87:41:@54.8]
  wire  _GEN_8; // @[AXI4LiteCSR.scala 87:41:@54.8]
  wire  _GEN_9; // @[AXI4LiteCSR.scala 87:41:@54.8]
  wire  _GEN_10; // @[AXI4LiteCSR.scala 87:41:@54.8]
  wire  _T_126; // @[Conditional.scala 37:30:@62.8]
  wire  _T_128; // @[AXI4LiteCSR.scala 96:28:@65.10]
  wire [2:0] _GEN_11; // @[AXI4LiteCSR.scala 96:38:@66.10]
  wire  _GEN_12; // @[AXI4LiteCSR.scala 96:38:@66.10]
  wire  _T_130; // @[Conditional.scala 37:30:@72.10]
  wire  _T_131; // @[AXI4LiteCSR.scala 102:30:@74.12]
  wire [2:0] _GEN_13; // @[AXI4LiteCSR.scala 102:41:@75.12]
  wire  _GEN_14; // @[AXI4LiteCSR.scala 102:41:@75.12]
  wire  _GEN_15; // @[AXI4LiteCSR.scala 102:41:@75.12]
  wire  _T_134; // @[Conditional.scala 37:30:@82.12]
  wire  _T_135; // @[AXI4LiteCSR.scala 109:28:@84.14]
  wire [2:0] _GEN_16; // @[AXI4LiteCSR.scala 109:38:@85.14]
  wire  _GEN_17; // @[AXI4LiteCSR.scala 109:38:@85.14]
  wire  _GEN_18; // @[AXI4LiteCSR.scala 109:38:@85.14]
  wire [31:0] _GEN_19; // @[AXI4LiteCSR.scala 109:38:@85.14]
  wire  _GEN_20; // @[AXI4LiteCSR.scala 109:38:@85.14]
  wire  _T_139; // @[Conditional.scala 37:30:@94.14]
  wire  _T_141; // @[AXI4LiteCSR.scala 119:28:@97.16]
  wire [2:0] _GEN_21; // @[AXI4LiteCSR.scala 119:38:@98.16]
  wire  _GEN_22; // @[AXI4LiteCSR.scala 119:38:@98.16]
  wire  _GEN_23; // @[Conditional.scala 39:67:@95.14]
  wire [2:0] _GEN_24; // @[Conditional.scala 39:67:@95.14]
  wire  _GEN_25; // @[Conditional.scala 39:67:@95.14]
  wire [2:0] _GEN_26; // @[Conditional.scala 39:67:@83.12]
  wire  _GEN_27; // @[Conditional.scala 39:67:@83.12]
  wire  _GEN_28; // @[Conditional.scala 39:67:@83.12]
  wire [31:0] _GEN_29; // @[Conditional.scala 39:67:@83.12]
  wire  _GEN_30; // @[Conditional.scala 39:67:@83.12]
  wire [2:0] _GEN_31; // @[Conditional.scala 39:67:@73.10]
  wire  _GEN_32; // @[Conditional.scala 39:67:@73.10]
  wire  _GEN_33; // @[Conditional.scala 39:67:@73.10]
  wire  _GEN_34; // @[Conditional.scala 39:67:@73.10]
  wire [31:0] _GEN_35; // @[Conditional.scala 39:67:@73.10]
  wire  _GEN_36; // @[Conditional.scala 39:67:@73.10]
  wire  _GEN_37; // @[Conditional.scala 39:67:@63.8]
  wire [2:0] _GEN_38; // @[Conditional.scala 39:67:@63.8]
  wire  _GEN_39; // @[Conditional.scala 39:67:@63.8]
  wire  _GEN_40; // @[Conditional.scala 39:67:@63.8]
  wire  _GEN_41; // @[Conditional.scala 39:67:@63.8]
  wire  _GEN_42; // @[Conditional.scala 39:67:@63.8]
  wire [31:0] _GEN_43; // @[Conditional.scala 39:67:@63.8]
  wire  _GEN_44; // @[Conditional.scala 39:67:@63.8]
  wire [2:0] _GEN_45; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_46; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_47; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_48; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_49; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_50; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_51; // @[Conditional.scala 39:67:@52.6]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@52.6]
  wire  _GEN_53; // @[Conditional.scala 39:67:@52.6]
  wire [2:0] _GEN_54; // @[Conditional.scala 40:58:@35.4]
  wire [31:0] _GEN_55; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_56; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_57; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_58; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_59; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_60; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_61; // @[Conditional.scala 40:58:@35.4]
  wire [31:0] _GEN_62; // @[Conditional.scala 40:58:@35.4]
  wire  _GEN_63; // @[Conditional.scala 40:58:@35.4]
  assign _T_116 = 3'h0 == state; // @[Conditional.scala 37:30:@34.4]
  assign _T_117 = io_ctl_aw_awaddr[5:2]; // @[AXI4LiteCSR.scala 77:33:@38.8]
  assign _T_119 = io_ctl_ar_araddr[5:2]; // @[AXI4LiteCSR.scala 82:33:@45.10]
  assign _GEN_0 = io_ctl_ar_arvalid ? 3'h1 : state; // @[AXI4LiteCSR.scala 80:36:@43.8]
  assign _GEN_1 = io_ctl_ar_arvalid ? {{28'd0}, _T_119} : addr; // @[AXI4LiteCSR.scala 80:36:@43.8]
  assign _GEN_2 = io_ctl_ar_arvalid ? 1'h1 : arready; // @[AXI4LiteCSR.scala 80:36:@43.8]
  assign _GEN_3 = io_ctl_aw_awvalid ? 3'h3 : _GEN_0; // @[AXI4LiteCSR.scala 75:30:@36.6]
  assign _GEN_4 = io_ctl_aw_awvalid ? {{28'd0}, _T_117} : _GEN_1; // @[AXI4LiteCSR.scala 75:30:@36.6]
  assign _GEN_5 = io_ctl_aw_awvalid ? 1'h1 : awready; // @[AXI4LiteCSR.scala 75:30:@36.6]
  assign _GEN_6 = io_ctl_aw_awvalid ? arready : _GEN_2; // @[AXI4LiteCSR.scala 75:30:@36.6]
  assign _T_121 = 3'h1 == state; // @[Conditional.scala 37:30:@51.6]
  assign _T_122 = io_ctl_ar_arvalid & arready; // @[AXI4LiteCSR.scala 87:30:@53.8]
  assign _GEN_7 = _T_122 ? 3'h2 : state; // @[AXI4LiteCSR.scala 87:41:@54.8]
  assign _GEN_8 = _T_122 ? 1'h1 : read; // @[AXI4LiteCSR.scala 87:41:@54.8]
  assign _GEN_9 = _T_122 ? 1'h0 : arready; // @[AXI4LiteCSR.scala 87:41:@54.8]
  assign _GEN_10 = _T_122 ? 1'h1 : rvalid; // @[AXI4LiteCSR.scala 87:41:@54.8]
  assign _T_126 = 3'h2 == state; // @[Conditional.scala 37:30:@62.8]
  assign _T_128 = io_ctl_r_rready & rvalid; // @[AXI4LiteCSR.scala 96:28:@65.10]
  assign _GEN_11 = _T_128 ? 3'h0 : state; // @[AXI4LiteCSR.scala 96:38:@66.10]
  assign _GEN_12 = _T_128 ? 1'h0 : rvalid; // @[AXI4LiteCSR.scala 96:38:@66.10]
  assign _T_130 = 3'h3 == state; // @[Conditional.scala 37:30:@72.10]
  assign _T_131 = io_ctl_aw_awvalid & awready; // @[AXI4LiteCSR.scala 102:30:@74.12]
  assign _GEN_13 = _T_131 ? 3'h4 : state; // @[AXI4LiteCSR.scala 102:41:@75.12]
  assign _GEN_14 = _T_131 ? 1'h0 : awready; // @[AXI4LiteCSR.scala 102:41:@75.12]
  assign _GEN_15 = _T_131 ? 1'h1 : wready; // @[AXI4LiteCSR.scala 102:41:@75.12]
  assign _T_134 = 3'h4 == state; // @[Conditional.scala 37:30:@82.12]
  assign _T_135 = io_ctl_w_wvalid & wready; // @[AXI4LiteCSR.scala 109:28:@84.14]
  assign _GEN_16 = _T_135 ? 3'h5 : state; // @[AXI4LiteCSR.scala 109:38:@85.14]
  assign _GEN_17 = _T_135 ? 1'h0 : wready; // @[AXI4LiteCSR.scala 109:38:@85.14]
  assign _GEN_18 = _T_135 ? 1'h1 : write; // @[AXI4LiteCSR.scala 109:38:@85.14]
  assign _GEN_19 = _T_135 ? io_ctl_w_wdata : wdata; // @[AXI4LiteCSR.scala 109:38:@85.14]
  assign _GEN_20 = _T_135 ? 1'h1 : bvalid; // @[AXI4LiteCSR.scala 109:38:@85.14]
  assign _T_139 = 3'h5 == state; // @[Conditional.scala 37:30:@94.14]
  assign _T_141 = io_ctl_b_bready & bvalid; // @[AXI4LiteCSR.scala 119:28:@97.16]
  assign _GEN_21 = _T_141 ? 3'h0 : state; // @[AXI4LiteCSR.scala 119:38:@98.16]
  assign _GEN_22 = _T_141 ? 1'h0 : bvalid; // @[AXI4LiteCSR.scala 119:38:@98.16]
  assign _GEN_23 = _T_139 ? 1'h0 : write; // @[Conditional.scala 39:67:@95.14]
  assign _GEN_24 = _T_139 ? _GEN_21 : state; // @[Conditional.scala 39:67:@95.14]
  assign _GEN_25 = _T_139 ? _GEN_22 : bvalid; // @[Conditional.scala 39:67:@95.14]
  assign _GEN_26 = _T_134 ? _GEN_16 : _GEN_24; // @[Conditional.scala 39:67:@83.12]
  assign _GEN_27 = _T_134 ? _GEN_17 : wready; // @[Conditional.scala 39:67:@83.12]
  assign _GEN_28 = _T_134 ? _GEN_18 : _GEN_23; // @[Conditional.scala 39:67:@83.12]
  assign _GEN_29 = _T_134 ? _GEN_19 : wdata; // @[Conditional.scala 39:67:@83.12]
  assign _GEN_30 = _T_134 ? _GEN_20 : _GEN_25; // @[Conditional.scala 39:67:@83.12]
  assign _GEN_31 = _T_130 ? _GEN_13 : _GEN_26; // @[Conditional.scala 39:67:@73.10]
  assign _GEN_32 = _T_130 ? _GEN_14 : awready; // @[Conditional.scala 39:67:@73.10]
  assign _GEN_33 = _T_130 ? _GEN_15 : _GEN_27; // @[Conditional.scala 39:67:@73.10]
  assign _GEN_34 = _T_130 ? write : _GEN_28; // @[Conditional.scala 39:67:@73.10]
  assign _GEN_35 = _T_130 ? wdata : _GEN_29; // @[Conditional.scala 39:67:@73.10]
  assign _GEN_36 = _T_130 ? bvalid : _GEN_30; // @[Conditional.scala 39:67:@73.10]
  assign _GEN_37 = _T_126 ? 1'h0 : read; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_38 = _T_126 ? _GEN_11 : _GEN_31; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_39 = _T_126 ? _GEN_12 : rvalid; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_40 = _T_126 ? awready : _GEN_32; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_41 = _T_126 ? wready : _GEN_33; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_42 = _T_126 ? write : _GEN_34; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_43 = _T_126 ? wdata : _GEN_35; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_44 = _T_126 ? bvalid : _GEN_36; // @[Conditional.scala 39:67:@63.8]
  assign _GEN_45 = _T_121 ? _GEN_7 : _GEN_38; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_46 = _T_121 ? _GEN_8 : _GEN_37; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_47 = _T_121 ? _GEN_9 : arready; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_48 = _T_121 ? _GEN_10 : _GEN_39; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_49 = _T_121 ? awready : _GEN_40; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_50 = _T_121 ? wready : _GEN_41; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_51 = _T_121 ? write : _GEN_42; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_52 = _T_121 ? wdata : _GEN_43; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_53 = _T_121 ? bvalid : _GEN_44; // @[Conditional.scala 39:67:@52.6]
  assign _GEN_54 = _T_116 ? _GEN_3 : _GEN_45; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_55 = _T_116 ? _GEN_4 : addr; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_56 = _T_116 ? _GEN_5 : _GEN_49; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_57 = _T_116 ? _GEN_6 : _GEN_47; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_58 = _T_116 ? read : _GEN_46; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_59 = _T_116 ? rvalid : _GEN_48; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_60 = _T_116 ? wready : _GEN_50; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_61 = _T_116 ? write : _GEN_51; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_62 = _T_116 ? wdata : _GEN_52; // @[Conditional.scala 40:58:@35.4]
  assign _GEN_63 = _T_116 ? bvalid : _GEN_53; // @[Conditional.scala 40:58:@35.4]
  assign io_ctl_aw_awready = awready; // @[AXI4LiteCSR.scala 60:21:@24.4]
  assign io_ctl_w_wready = wready; // @[AXI4LiteCSR.scala 61:19:@25.4]
  assign io_ctl_b_bvalid = bvalid; // @[AXI4LiteCSR.scala 62:19:@26.4]
  assign io_ctl_ar_arready = arready; // @[AXI4LiteCSR.scala 65:21:@28.4]
  assign io_ctl_r_rdata = io_bus_dataIn; // @[AXI4LiteCSR.scala 57:18:@22.4]
  assign io_ctl_r_rvalid = rvalid; // @[AXI4LiteCSR.scala 66:19:@29.4]
  assign io_bus_addr = addr[3:0]; // @[AXI4LiteCSR.scala 71:15:@33.4]
  assign io_bus_dataOut = wdata; // @[AXI4LiteCSR.scala 58:18:@23.4]
  assign io_bus_write = write; // @[AXI4LiteCSR.scala 70:16:@32.4]
  assign io_bus_read = read; // @[AXI4LiteCSR.scala 69:15:@31.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  awready = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  wready = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  bvalid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  arready = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  rvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  addr = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  read = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  write = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  wdata = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_116) begin
        if (io_ctl_aw_awvalid) begin
          state <= 3'h3;
        end else begin
          if (io_ctl_ar_arvalid) begin
            state <= 3'h1;
          end
        end
      end else begin
        if (_T_121) begin
          if (_T_122) begin
            state <= 3'h2;
          end
        end else begin
          if (_T_126) begin
            if (_T_128) begin
              state <= 3'h0;
            end
          end else begin
            if (_T_130) begin
              if (_T_131) begin
                state <= 3'h4;
              end
            end else begin
              if (_T_134) begin
                if (_T_135) begin
                  state <= 3'h5;
                end
              end else begin
                if (_T_139) begin
                  if (_T_141) begin
                    state <= 3'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      awready <= 1'h0;
    end else begin
      if (_T_116) begin
        if (io_ctl_aw_awvalid) begin
          awready <= 1'h1;
        end
      end else begin
        if (!(_T_121)) begin
          if (!(_T_126)) begin
            if (_T_130) begin
              if (_T_131) begin
                awready <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      wready <= 1'h0;
    end else begin
      if (!(_T_116)) begin
        if (!(_T_121)) begin
          if (!(_T_126)) begin
            if (_T_130) begin
              if (_T_131) begin
                wready <= 1'h1;
              end
            end else begin
              if (_T_134) begin
                if (_T_135) begin
                  wready <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      bvalid <= 1'h0;
    end else begin
      if (!(_T_116)) begin
        if (!(_T_121)) begin
          if (!(_T_126)) begin
            if (!(_T_130)) begin
              if (_T_134) begin
                if (_T_135) begin
                  bvalid <= 1'h1;
                end
              end else begin
                if (_T_139) begin
                  if (_T_141) begin
                    bvalid <= 1'h0;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      arready <= 1'h0;
    end else begin
      if (_T_116) begin
        if (!(io_ctl_aw_awvalid)) begin
          if (io_ctl_ar_arvalid) begin
            arready <= 1'h1;
          end
        end
      end else begin
        if (_T_121) begin
          if (_T_122) begin
            arready <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      rvalid <= 1'h0;
    end else begin
      if (!(_T_116)) begin
        if (_T_121) begin
          if (_T_122) begin
            rvalid <= 1'h1;
          end
        end else begin
          if (_T_126) begin
            if (_T_128) begin
              rvalid <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      addr <= 32'h0;
    end else begin
      if (_T_116) begin
        if (io_ctl_aw_awvalid) begin
          addr <= {{28'd0}, _T_117};
        end else begin
          if (io_ctl_ar_arvalid) begin
            addr <= {{28'd0}, _T_119};
          end
        end
      end
    end
    if (reset) begin
      read <= 1'h0;
    end else begin
      if (!(_T_116)) begin
        if (_T_121) begin
          if (_T_122) begin
            read <= 1'h1;
          end
        end else begin
          if (_T_126) begin
            read <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      write <= 1'h0;
    end else begin
      if (!(_T_116)) begin
        if (!(_T_121)) begin
          if (!(_T_126)) begin
            if (!(_T_130)) begin
              if (_T_134) begin
                if (_T_135) begin
                  write <= 1'h1;
                end
              end else begin
                if (_T_139) begin
                  write <= 1'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      wdata <= 32'h0;
    end else begin
      if (!(_T_116)) begin
        if (!(_T_121)) begin
          if (!(_T_126)) begin
            if (!(_T_130)) begin
              if (_T_134) begin
                if (_T_135) begin
                  wdata <= io_ctl_w_wdata;
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
module AXI4Reader( // @[:@104.2]
  input         clock, // @[:@105.4]
  input         reset, // @[:@106.4]
  output [31:0] io_bus_ar_araddr, // @[:@107.4]
  output [7:0]  io_bus_ar_arlen, // @[:@107.4]
  output        io_bus_ar_arvalid, // @[:@107.4]
  input         io_bus_ar_arready, // @[:@107.4]
  input  [63:0] io_bus_r_rdata, // @[:@107.4]
  input         io_bus_r_rlast, // @[:@107.4]
  input         io_bus_r_rvalid, // @[:@107.4]
  output        io_bus_r_rready, // @[:@107.4]
  input         io_dataOut_ready, // @[:@107.4]
  output        io_dataOut_valid, // @[:@107.4]
  output [63:0] io_dataOut_bits, // @[:@107.4]
  output        io_xfer_done, // @[:@107.4]
  input  [31:0] io_xfer_address, // @[:@107.4]
  input  [31:0] io_xfer_length, // @[:@107.4]
  input         io_xfer_valid // @[:@107.4]
);
  reg [1:0] state; // @[AXI4Reader.scala 42:22:@109.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXI4Reader.scala 44:21:@110.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXI4Reader.scala 45:23:@111.4]
  reg [31:0] _RAND_2;
  reg [31:0] araddr; // @[AXI4Reader.scala 47:23:@113.4]
  reg [31:0] _RAND_3;
  reg [7:0] arlen; // @[AXI4Reader.scala 48:22:@114.4]
  reg [31:0] _RAND_4;
  reg  arvalid; // @[AXI4Reader.scala 49:24:@115.4]
  reg [31:0] _RAND_5;
  wire  ready; // @[AXI4Reader.scala 52:41:@118.4]
  wire  valid; // @[AXI4Reader.scala 53:40:@121.4]
  wire  _T_227; // @[Conditional.scala 37:30:@195.4]
  wire [32:0] _T_231; // @[AXI4Reader.scala 72:33:@202.8]
  wire [32:0] _T_232; // @[AXI4Reader.scala 72:33:@203.8]
  wire [31:0] _T_233; // @[AXI4Reader.scala 72:33:@204.8]
  wire [1:0] _GEN_0; // @[AXI4Reader.scala 68:26:@198.6]
  wire  _GEN_1; // @[AXI4Reader.scala 68:26:@198.6]
  wire [31:0] _GEN_2; // @[AXI4Reader.scala 68:26:@198.6]
  wire [31:0] _GEN_3; // @[AXI4Reader.scala 68:26:@198.6]
  wire  _T_234; // @[Conditional.scala 37:30:@209.6]
  wire  _T_235; // @[AXI4Reader.scala 76:20:@211.8]
  wire [1:0] _GEN_4; // @[AXI4Reader.scala 76:41:@212.8]
  wire  _GEN_5; // @[AXI4Reader.scala 76:41:@212.8]
  wire  _GEN_6; // @[AXI4Reader.scala 76:41:@212.8]
  wire  _T_238; // @[Conditional.scala 37:30:@219.8]
  wire  _T_239; // @[AXI4Reader.scala 83:18:@221.10]
  wire [1:0] _GEN_7; // @[AXI4Reader.scala 84:29:@223.12]
  wire  _GEN_8; // @[AXI4Reader.scala 84:29:@223.12]
  wire [1:0] _GEN_9; // @[AXI4Reader.scala 83:27:@222.10]
  wire  _GEN_10; // @[AXI4Reader.scala 83:27:@222.10]
  wire  _T_241; // @[Conditional.scala 37:30:@230.10]
  wire  _GEN_11; // @[Conditional.scala 39:67:@231.10]
  wire [1:0] _GEN_12; // @[Conditional.scala 39:67:@231.10]
  wire [1:0] _GEN_13; // @[Conditional.scala 39:67:@220.8]
  wire  _GEN_14; // @[Conditional.scala 39:67:@220.8]
  wire  _GEN_15; // @[Conditional.scala 39:67:@220.8]
  wire [1:0] _GEN_16; // @[Conditional.scala 39:67:@210.6]
  wire  _GEN_17; // @[Conditional.scala 39:67:@210.6]
  wire  _GEN_18; // @[Conditional.scala 39:67:@210.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@210.6]
  wire  _GEN_20; // @[Conditional.scala 40:58:@196.4]
  wire [1:0] _GEN_21; // @[Conditional.scala 40:58:@196.4]
  wire  _GEN_22; // @[Conditional.scala 40:58:@196.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@196.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@196.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@196.4]
  assign ready = io_dataOut_ready & enable; // @[AXI4Reader.scala 52:41:@118.4]
  assign valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 53:40:@121.4]
  assign _T_227 = 2'h0 == state; // @[Conditional.scala 37:30:@195.4]
  assign _T_231 = io_xfer_length - 32'h1; // @[AXI4Reader.scala 72:33:@202.8]
  assign _T_232 = $unsigned(_T_231); // @[AXI4Reader.scala 72:33:@203.8]
  assign _T_233 = _T_232[31:0]; // @[AXI4Reader.scala 72:33:@204.8]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : state; // @[AXI4Reader.scala 68:26:@198.6]
  assign _GEN_1 = io_xfer_valid ? 1'h1 : arvalid; // @[AXI4Reader.scala 68:26:@198.6]
  assign _GEN_2 = io_xfer_valid ? io_xfer_address : araddr; // @[AXI4Reader.scala 68:26:@198.6]
  assign _GEN_3 = io_xfer_valid ? _T_233 : {{24'd0}, arlen}; // @[AXI4Reader.scala 68:26:@198.6]
  assign _T_234 = 2'h1 == state; // @[Conditional.scala 37:30:@209.6]
  assign _T_235 = arvalid & io_bus_ar_arready; // @[AXI4Reader.scala 76:20:@211.8]
  assign _GEN_4 = _T_235 ? 2'h2 : state; // @[AXI4Reader.scala 76:41:@212.8]
  assign _GEN_5 = _T_235 ? 1'h0 : arvalid; // @[AXI4Reader.scala 76:41:@212.8]
  assign _GEN_6 = _T_235 ? 1'h1 : enable; // @[AXI4Reader.scala 76:41:@212.8]
  assign _T_238 = 2'h2 == state; // @[Conditional.scala 37:30:@219.8]
  assign _T_239 = ready & valid; // @[AXI4Reader.scala 83:18:@221.10]
  assign _GEN_7 = io_bus_r_rlast ? 2'h3 : state; // @[AXI4Reader.scala 84:29:@223.12]
  assign _GEN_8 = io_bus_r_rlast ? 1'h0 : enable; // @[AXI4Reader.scala 84:29:@223.12]
  assign _GEN_9 = _T_239 ? _GEN_7 : state; // @[AXI4Reader.scala 83:27:@222.10]
  assign _GEN_10 = _T_239 ? _GEN_8 : enable; // @[AXI4Reader.scala 83:27:@222.10]
  assign _T_241 = 2'h3 == state; // @[Conditional.scala 37:30:@230.10]
  assign _GEN_11 = _T_241 ? 1'h1 : done; // @[Conditional.scala 39:67:@231.10]
  assign _GEN_12 = _T_241 ? 2'h0 : state; // @[Conditional.scala 39:67:@231.10]
  assign _GEN_13 = _T_238 ? _GEN_9 : _GEN_12; // @[Conditional.scala 39:67:@220.8]
  assign _GEN_14 = _T_238 ? _GEN_10 : enable; // @[Conditional.scala 39:67:@220.8]
  assign _GEN_15 = _T_238 ? done : _GEN_11; // @[Conditional.scala 39:67:@220.8]
  assign _GEN_16 = _T_234 ? _GEN_4 : _GEN_13; // @[Conditional.scala 39:67:@210.6]
  assign _GEN_17 = _T_234 ? _GEN_5 : arvalid; // @[Conditional.scala 39:67:@210.6]
  assign _GEN_18 = _T_234 ? _GEN_6 : _GEN_14; // @[Conditional.scala 39:67:@210.6]
  assign _GEN_19 = _T_234 ? done : _GEN_15; // @[Conditional.scala 39:67:@210.6]
  assign _GEN_20 = _T_227 ? 1'h0 : _GEN_19; // @[Conditional.scala 40:58:@196.4]
  assign _GEN_21 = _T_227 ? _GEN_0 : _GEN_16; // @[Conditional.scala 40:58:@196.4]
  assign _GEN_22 = _T_227 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@196.4]
  assign _GEN_23 = _T_227 ? _GEN_2 : araddr; // @[Conditional.scala 40:58:@196.4]
  assign _GEN_24 = _T_227 ? _GEN_3 : {{24'd0}, arlen}; // @[Conditional.scala 40:58:@196.4]
  assign _GEN_25 = _T_227 ? enable : _GEN_18; // @[Conditional.scala 40:58:@196.4]
  assign io_bus_ar_araddr = araddr; // @[AXI4Reader.scala 58:13:@182.4]
  assign io_bus_ar_arlen = arlen; // @[AXI4Reader.scala 58:13:@181.4]
  assign io_bus_ar_arvalid = arvalid; // @[AXI4Reader.scala 58:13:@174.4]
  assign io_bus_r_rready = io_dataOut_ready & enable; // @[AXI4Reader.scala 59:12:@186.4]
  assign io_dataOut_valid = io_bus_r_rvalid & enable; // @[AXI4Reader.scala 61:20:@192.4]
  assign io_dataOut_bits = io_bus_r_rdata; // @[AXI4Reader.scala 62:19:@193.4]
  assign io_xfer_done = done; // @[AXI4Reader.scala 63:16:@194.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  done = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  araddr = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  arlen = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  arvalid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_227) begin
        if (io_xfer_valid) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_234) begin
          if (_T_235) begin
            state <= 2'h2;
          end
        end else begin
          if (_T_238) begin
            if (_T_239) begin
              if (io_bus_r_rlast) begin
                state <= 2'h3;
              end
            end
          end else begin
            if (_T_241) begin
              state <= 2'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_227) begin
        done <= 1'h0;
      end else begin
        if (!(_T_234)) begin
          if (!(_T_238)) begin
            if (_T_241) begin
              done <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (!(_T_227)) begin
        if (_T_234) begin
          if (_T_235) begin
            enable <= 1'h1;
          end
        end else begin
          if (_T_238) begin
            if (_T_239) begin
              if (io_bus_r_rlast) begin
                enable <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      araddr <= 32'h0;
    end else begin
      if (_T_227) begin
        if (io_xfer_valid) begin
          araddr <= io_xfer_address;
        end
      end
    end
    if (reset) begin
      arlen <= 8'h0;
    end else begin
      arlen <= _GEN_24[7:0];
    end
    if (reset) begin
      arvalid <= 1'h0;
    end else begin
      if (_T_227) begin
        if (io_xfer_valid) begin
          arvalid <= 1'h1;
        end
      end else begin
        if (_T_234) begin
          if (_T_235) begin
            arvalid <= 1'h0;
          end
        end
      end
    end
  end
endmodule
module AXIStreamMaster( // @[:@236.2]
  input         clock, // @[:@237.4]
  input         reset, // @[:@238.4]
  output [63:0] io_bus_tdata, // @[:@239.4]
  output        io_bus_tvalid, // @[:@239.4]
  input         io_bus_tready, // @[:@239.4]
  output        io_bus_tlast, // @[:@239.4]
  output        io_dataIn_ready, // @[:@239.4]
  input         io_dataIn_valid, // @[:@239.4]
  input  [63:0] io_dataIn_bits, // @[:@239.4]
  output        io_xfer_done, // @[:@239.4]
  input  [31:0] io_xfer_length, // @[:@239.4]
  input         io_xfer_valid // @[:@239.4]
);
  reg [1:0] state; // @[AXIStreamMaster.scala 42:22:@241.4]
  reg [31:0] _RAND_0;
  reg  done; // @[AXIStreamMaster.scala 44:21:@242.4]
  reg [31:0] _RAND_1;
  reg  enable; // @[AXIStreamMaster.scala 46:23:@243.4]
  reg [31:0] _RAND_2;
  reg [31:0] length; // @[AXIStreamMaster.scala 50:23:@247.4]
  reg [31:0] _RAND_3;
  wire  ready; // @[AXIStreamMaster.scala 52:38:@248.4]
  wire  valid; // @[AXIStreamMaster.scala 53:40:@251.4]
  wire  last; // @[AXIStreamMaster.scala 64:18:@260.4]
  wire  _T_62; // @[Conditional.scala 37:30:@262.4]
  wire [1:0] _GEN_0; // @[AXIStreamMaster.scala 71:26:@266.6]
  wire [31:0] _GEN_1; // @[AXIStreamMaster.scala 71:26:@266.6]
  wire  _T_66; // @[Conditional.scala 37:30:@273.6]
  wire  _T_67; // @[AXIStreamMaster.scala 78:18:@275.8]
  wire [32:0] _T_69; // @[AXIStreamMaster.scala 79:26:@277.10]
  wire [32:0] _T_70; // @[AXIStreamMaster.scala 79:26:@278.10]
  wire [31:0] _T_71; // @[AXIStreamMaster.scala 79:26:@279.10]
  wire [1:0] _GEN_3; // @[AXIStreamMaster.scala 80:29:@282.10]
  wire  _GEN_4; // @[AXIStreamMaster.scala 80:29:@282.10]
  wire [31:0] _GEN_5; // @[AXIStreamMaster.scala 78:27:@276.8]
  wire [1:0] _GEN_6; // @[AXIStreamMaster.scala 78:27:@276.8]
  wire  _GEN_7; // @[AXIStreamMaster.scala 78:27:@276.8]
  wire  _T_75; // @[Conditional.scala 37:30:@289.8]
  wire [1:0] _GEN_8; // @[Conditional.scala 39:67:@290.8]
  wire  _GEN_9; // @[Conditional.scala 39:67:@290.8]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67:@274.6]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@274.6]
  wire  _GEN_12; // @[Conditional.scala 39:67:@274.6]
  wire  _GEN_13; // @[Conditional.scala 39:67:@274.6]
  wire  _GEN_14; // @[Conditional.scala 40:58:@263.4]
  wire  _GEN_15; // @[Conditional.scala 40:58:@263.4]
  wire [1:0] _GEN_16; // @[Conditional.scala 40:58:@263.4]
  wire [31:0] _GEN_17; // @[Conditional.scala 40:58:@263.4]
  assign ready = io_bus_tready & enable; // @[AXIStreamMaster.scala 52:38:@248.4]
  assign valid = io_dataIn_valid & enable; // @[AXIStreamMaster.scala 53:40:@251.4]
  assign last = length == 32'h1; // @[AXIStreamMaster.scala 64:18:@260.4]
  assign _T_62 = 2'h0 == state; // @[Conditional.scala 37:30:@262.4]
  assign _GEN_0 = io_xfer_valid ? 2'h1 : state; // @[AXIStreamMaster.scala 71:26:@266.6]
  assign _GEN_1 = io_xfer_valid ? io_xfer_length : length; // @[AXIStreamMaster.scala 71:26:@266.6]
  assign _T_66 = 2'h1 == state; // @[Conditional.scala 37:30:@273.6]
  assign _T_67 = ready & valid; // @[AXIStreamMaster.scala 78:18:@275.8]
  assign _T_69 = length - 32'h1; // @[AXIStreamMaster.scala 79:26:@277.10]
  assign _T_70 = $unsigned(_T_69); // @[AXIStreamMaster.scala 79:26:@278.10]
  assign _T_71 = _T_70[31:0]; // @[AXIStreamMaster.scala 79:26:@279.10]
  assign _GEN_3 = last ? 2'h2 : state; // @[AXIStreamMaster.scala 80:29:@282.10]
  assign _GEN_4 = last ? 1'h0 : enable; // @[AXIStreamMaster.scala 80:29:@282.10]
  assign _GEN_5 = _T_67 ? _T_71 : length; // @[AXIStreamMaster.scala 78:27:@276.8]
  assign _GEN_6 = _T_67 ? _GEN_3 : state; // @[AXIStreamMaster.scala 78:27:@276.8]
  assign _GEN_7 = _T_67 ? _GEN_4 : enable; // @[AXIStreamMaster.scala 78:27:@276.8]
  assign _T_75 = 2'h2 == state; // @[Conditional.scala 37:30:@289.8]
  assign _GEN_8 = _T_75 ? 2'h0 : state; // @[Conditional.scala 39:67:@290.8]
  assign _GEN_9 = _T_75 ? 1'h1 : done; // @[Conditional.scala 39:67:@290.8]
  assign _GEN_10 = _T_66 ? _GEN_5 : length; // @[Conditional.scala 39:67:@274.6]
  assign _GEN_11 = _T_66 ? _GEN_6 : _GEN_8; // @[Conditional.scala 39:67:@274.6]
  assign _GEN_12 = _T_66 ? _GEN_7 : enable; // @[Conditional.scala 39:67:@274.6]
  assign _GEN_13 = _T_66 ? done : _GEN_9; // @[Conditional.scala 39:67:@274.6]
  assign _GEN_14 = _T_62 ? 1'h0 : _GEN_13; // @[Conditional.scala 40:58:@263.4]
  assign _GEN_15 = _T_62 ? io_xfer_valid : _GEN_12; // @[Conditional.scala 40:58:@263.4]
  assign _GEN_16 = _T_62 ? _GEN_0 : _GEN_11; // @[Conditional.scala 40:58:@263.4]
  assign _GEN_17 = _T_62 ? _GEN_1 : _GEN_10; // @[Conditional.scala 40:58:@263.4]
  assign io_bus_tdata = io_dataIn_bits; // @[AXIStreamMaster.scala 58:16:@256.4]
  assign io_bus_tvalid = io_dataIn_valid & enable; // @[AXIStreamMaster.scala 55:17:@254.4]
  assign io_bus_tlast = length == 32'h1; // @[AXIStreamMaster.scala 59:16:@257.4]
  assign io_dataIn_ready = io_bus_tready & enable; // @[AXIStreamMaster.scala 56:19:@255.4]
  assign io_xfer_done = done; // @[AXIStreamMaster.scala 62:16:@259.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  done = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enable = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  length = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_62) begin
        if (io_xfer_valid) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_66) begin
          if (_T_67) begin
            if (last) begin
              state <= 2'h2;
            end
          end
        end else begin
          if (_T_75) begin
            state <= 2'h0;
          end
        end
      end
    end
    if (reset) begin
      done <= 1'h0;
    end else begin
      if (_T_62) begin
        done <= 1'h0;
      end else begin
        if (!(_T_66)) begin
          if (_T_75) begin
            done <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      enable <= 1'h0;
    end else begin
      if (_T_62) begin
        enable <= io_xfer_valid;
      end else begin
        if (_T_66) begin
          if (_T_67) begin
            if (last) begin
              enable <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      length <= 32'h0;
    end else begin
      if (_T_62) begin
        if (io_xfer_valid) begin
          length <= io_xfer_length;
        end
      end else begin
        if (_T_66) begin
          if (_T_67) begin
            length <= _T_71;
          end
        end
      end
    end
  end
endmodule
module CSR( // @[:@295.2]
  output [31:0] io_csr_0_dataOut, // @[:@298.4]
  output        io_csr_0_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_0_dataIn, // @[:@298.4]
  input  [31:0] io_csr_1_dataIn, // @[:@298.4]
  output [31:0] io_csr_2_dataOut, // @[:@298.4]
  output        io_csr_2_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_2_dataIn, // @[:@298.4]
  output [31:0] io_csr_3_dataOut, // @[:@298.4]
  output        io_csr_3_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_3_dataIn, // @[:@298.4]
  output [31:0] io_csr_4_dataOut, // @[:@298.4]
  output        io_csr_4_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_4_dataIn, // @[:@298.4]
  output [31:0] io_csr_5_dataOut, // @[:@298.4]
  output        io_csr_5_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_5_dataIn, // @[:@298.4]
  output [31:0] io_csr_6_dataOut, // @[:@298.4]
  output        io_csr_6_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_6_dataIn, // @[:@298.4]
  output [31:0] io_csr_7_dataOut, // @[:@298.4]
  output        io_csr_7_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_7_dataIn, // @[:@298.4]
  output [31:0] io_csr_8_dataOut, // @[:@298.4]
  output        io_csr_8_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_8_dataIn, // @[:@298.4]
  output [31:0] io_csr_9_dataOut, // @[:@298.4]
  output        io_csr_9_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_9_dataIn, // @[:@298.4]
  output [31:0] io_csr_10_dataOut, // @[:@298.4]
  output        io_csr_10_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_10_dataIn, // @[:@298.4]
  output [31:0] io_csr_11_dataOut, // @[:@298.4]
  output        io_csr_11_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_11_dataIn, // @[:@298.4]
  output [31:0] io_csr_12_dataOut, // @[:@298.4]
  output        io_csr_12_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_12_dataIn, // @[:@298.4]
  output [31:0] io_csr_13_dataOut, // @[:@298.4]
  output        io_csr_13_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_13_dataIn, // @[:@298.4]
  output [31:0] io_csr_14_dataOut, // @[:@298.4]
  output        io_csr_14_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_14_dataIn, // @[:@298.4]
  output [31:0] io_csr_15_dataOut, // @[:@298.4]
  output        io_csr_15_dataWrite, // @[:@298.4]
  input  [31:0] io_csr_15_dataIn, // @[:@298.4]
  input  [3:0]  io_bus_addr, // @[:@298.4]
  input  [31:0] io_bus_dataOut, // @[:@298.4]
  output [31:0] io_bus_dataIn, // @[:@298.4]
  input         io_bus_write, // @[:@298.4]
  input         io_bus_read // @[:@298.4]
);
  wire  _T_178; // @[CSR.scala 40:22:@303.4]
  wire  _T_179; // @[CSR.scala 40:30:@304.4]
  wire [31:0] _GEN_0; // @[CSR.scala 40:45:@305.4]
  wire  _T_184; // @[CSR.scala 47:30:@313.4]
  wire  _T_189; // @[CSR.scala 40:22:@322.4]
  wire  _T_190; // @[CSR.scala 40:30:@323.4]
  wire [31:0] _GEN_4; // @[CSR.scala 40:45:@324.4]
  wire  _T_200; // @[CSR.scala 40:22:@341.4]
  wire  _T_201; // @[CSR.scala 40:30:@342.4]
  wire [31:0] _GEN_8; // @[CSR.scala 40:45:@343.4]
  wire  _T_206; // @[CSR.scala 47:30:@351.4]
  wire  _T_211; // @[CSR.scala 40:22:@360.4]
  wire  _T_212; // @[CSR.scala 40:30:@361.4]
  wire [31:0] _GEN_12; // @[CSR.scala 40:45:@362.4]
  wire  _T_217; // @[CSR.scala 47:30:@370.4]
  wire  _T_222; // @[CSR.scala 40:22:@379.4]
  wire  _T_223; // @[CSR.scala 40:30:@380.4]
  wire [31:0] _GEN_16; // @[CSR.scala 40:45:@381.4]
  wire  _T_228; // @[CSR.scala 47:30:@389.4]
  wire  _T_233; // @[CSR.scala 40:22:@398.4]
  wire  _T_234; // @[CSR.scala 40:30:@399.4]
  wire [31:0] _GEN_20; // @[CSR.scala 40:45:@400.4]
  wire  _T_239; // @[CSR.scala 47:30:@408.4]
  wire  _T_244; // @[CSR.scala 40:22:@417.4]
  wire  _T_245; // @[CSR.scala 40:30:@418.4]
  wire [31:0] _GEN_24; // @[CSR.scala 40:45:@419.4]
  wire  _T_250; // @[CSR.scala 47:30:@427.4]
  wire  _T_255; // @[CSR.scala 40:22:@436.4]
  wire  _T_256; // @[CSR.scala 40:30:@437.4]
  wire [31:0] _GEN_28; // @[CSR.scala 40:45:@438.4]
  wire  _T_261; // @[CSR.scala 47:30:@446.4]
  wire  _T_266; // @[CSR.scala 40:22:@455.4]
  wire  _T_267; // @[CSR.scala 40:30:@456.4]
  wire [31:0] _GEN_32; // @[CSR.scala 40:45:@457.4]
  wire  _T_272; // @[CSR.scala 47:30:@465.4]
  wire  _T_277; // @[CSR.scala 40:22:@474.4]
  wire  _T_278; // @[CSR.scala 40:30:@475.4]
  wire [31:0] _GEN_36; // @[CSR.scala 40:45:@476.4]
  wire  _T_283; // @[CSR.scala 47:30:@484.4]
  wire  _T_288; // @[CSR.scala 40:22:@493.4]
  wire  _T_289; // @[CSR.scala 40:30:@494.4]
  wire [31:0] _GEN_40; // @[CSR.scala 40:45:@495.4]
  wire  _T_294; // @[CSR.scala 47:30:@503.4]
  wire  _T_299; // @[CSR.scala 40:22:@512.4]
  wire  _T_300; // @[CSR.scala 40:30:@513.4]
  wire [31:0] _GEN_44; // @[CSR.scala 40:45:@514.4]
  wire  _T_305; // @[CSR.scala 47:30:@522.4]
  wire  _T_310; // @[CSR.scala 40:22:@531.4]
  wire  _T_311; // @[CSR.scala 40:30:@532.4]
  wire [31:0] _GEN_48; // @[CSR.scala 40:45:@533.4]
  wire  _T_316; // @[CSR.scala 47:30:@541.4]
  wire  _T_321; // @[CSR.scala 40:22:@550.4]
  wire  _T_322; // @[CSR.scala 40:30:@551.4]
  wire [31:0] _GEN_52; // @[CSR.scala 40:45:@552.4]
  wire  _T_327; // @[CSR.scala 47:30:@560.4]
  wire  _T_332; // @[CSR.scala 40:22:@569.4]
  wire  _T_333; // @[CSR.scala 40:30:@570.4]
  wire [31:0] _GEN_56; // @[CSR.scala 40:45:@571.4]
  wire  _T_338; // @[CSR.scala 47:30:@579.4]
  wire  _T_343; // @[CSR.scala 40:22:@588.4]
  wire  _T_344; // @[CSR.scala 40:30:@589.4]
  wire  _T_349; // @[CSR.scala 47:30:@598.4]
  assign _T_178 = io_bus_addr == 4'h0; // @[CSR.scala 40:22:@303.4]
  assign _T_179 = _T_178 & io_bus_read; // @[CSR.scala 40:30:@304.4]
  assign _GEN_0 = _T_179 ? io_csr_0_dataIn : 32'h0; // @[CSR.scala 40:45:@305.4]
  assign _T_184 = _T_178 & io_bus_write; // @[CSR.scala 47:30:@313.4]
  assign _T_189 = io_bus_addr == 4'h1; // @[CSR.scala 40:22:@322.4]
  assign _T_190 = _T_189 & io_bus_read; // @[CSR.scala 40:30:@323.4]
  assign _GEN_4 = _T_190 ? io_csr_1_dataIn : _GEN_0; // @[CSR.scala 40:45:@324.4]
  assign _T_200 = io_bus_addr == 4'h2; // @[CSR.scala 40:22:@341.4]
  assign _T_201 = _T_200 & io_bus_read; // @[CSR.scala 40:30:@342.4]
  assign _GEN_8 = _T_201 ? io_csr_2_dataIn : _GEN_4; // @[CSR.scala 40:45:@343.4]
  assign _T_206 = _T_200 & io_bus_write; // @[CSR.scala 47:30:@351.4]
  assign _T_211 = io_bus_addr == 4'h3; // @[CSR.scala 40:22:@360.4]
  assign _T_212 = _T_211 & io_bus_read; // @[CSR.scala 40:30:@361.4]
  assign _GEN_12 = _T_212 ? io_csr_3_dataIn : _GEN_8; // @[CSR.scala 40:45:@362.4]
  assign _T_217 = _T_211 & io_bus_write; // @[CSR.scala 47:30:@370.4]
  assign _T_222 = io_bus_addr == 4'h4; // @[CSR.scala 40:22:@379.4]
  assign _T_223 = _T_222 & io_bus_read; // @[CSR.scala 40:30:@380.4]
  assign _GEN_16 = _T_223 ? io_csr_4_dataIn : _GEN_12; // @[CSR.scala 40:45:@381.4]
  assign _T_228 = _T_222 & io_bus_write; // @[CSR.scala 47:30:@389.4]
  assign _T_233 = io_bus_addr == 4'h5; // @[CSR.scala 40:22:@398.4]
  assign _T_234 = _T_233 & io_bus_read; // @[CSR.scala 40:30:@399.4]
  assign _GEN_20 = _T_234 ? io_csr_5_dataIn : _GEN_16; // @[CSR.scala 40:45:@400.4]
  assign _T_239 = _T_233 & io_bus_write; // @[CSR.scala 47:30:@408.4]
  assign _T_244 = io_bus_addr == 4'h6; // @[CSR.scala 40:22:@417.4]
  assign _T_245 = _T_244 & io_bus_read; // @[CSR.scala 40:30:@418.4]
  assign _GEN_24 = _T_245 ? io_csr_6_dataIn : _GEN_20; // @[CSR.scala 40:45:@419.4]
  assign _T_250 = _T_244 & io_bus_write; // @[CSR.scala 47:30:@427.4]
  assign _T_255 = io_bus_addr == 4'h7; // @[CSR.scala 40:22:@436.4]
  assign _T_256 = _T_255 & io_bus_read; // @[CSR.scala 40:30:@437.4]
  assign _GEN_28 = _T_256 ? io_csr_7_dataIn : _GEN_24; // @[CSR.scala 40:45:@438.4]
  assign _T_261 = _T_255 & io_bus_write; // @[CSR.scala 47:30:@446.4]
  assign _T_266 = io_bus_addr == 4'h8; // @[CSR.scala 40:22:@455.4]
  assign _T_267 = _T_266 & io_bus_read; // @[CSR.scala 40:30:@456.4]
  assign _GEN_32 = _T_267 ? io_csr_8_dataIn : _GEN_28; // @[CSR.scala 40:45:@457.4]
  assign _T_272 = _T_266 & io_bus_write; // @[CSR.scala 47:30:@465.4]
  assign _T_277 = io_bus_addr == 4'h9; // @[CSR.scala 40:22:@474.4]
  assign _T_278 = _T_277 & io_bus_read; // @[CSR.scala 40:30:@475.4]
  assign _GEN_36 = _T_278 ? io_csr_9_dataIn : _GEN_32; // @[CSR.scala 40:45:@476.4]
  assign _T_283 = _T_277 & io_bus_write; // @[CSR.scala 47:30:@484.4]
  assign _T_288 = io_bus_addr == 4'ha; // @[CSR.scala 40:22:@493.4]
  assign _T_289 = _T_288 & io_bus_read; // @[CSR.scala 40:30:@494.4]
  assign _GEN_40 = _T_289 ? io_csr_10_dataIn : _GEN_36; // @[CSR.scala 40:45:@495.4]
  assign _T_294 = _T_288 & io_bus_write; // @[CSR.scala 47:30:@503.4]
  assign _T_299 = io_bus_addr == 4'hb; // @[CSR.scala 40:22:@512.4]
  assign _T_300 = _T_299 & io_bus_read; // @[CSR.scala 40:30:@513.4]
  assign _GEN_44 = _T_300 ? io_csr_11_dataIn : _GEN_40; // @[CSR.scala 40:45:@514.4]
  assign _T_305 = _T_299 & io_bus_write; // @[CSR.scala 47:30:@522.4]
  assign _T_310 = io_bus_addr == 4'hc; // @[CSR.scala 40:22:@531.4]
  assign _T_311 = _T_310 & io_bus_read; // @[CSR.scala 40:30:@532.4]
  assign _GEN_48 = _T_311 ? io_csr_12_dataIn : _GEN_44; // @[CSR.scala 40:45:@533.4]
  assign _T_316 = _T_310 & io_bus_write; // @[CSR.scala 47:30:@541.4]
  assign _T_321 = io_bus_addr == 4'hd; // @[CSR.scala 40:22:@550.4]
  assign _T_322 = _T_321 & io_bus_read; // @[CSR.scala 40:30:@551.4]
  assign _GEN_52 = _T_322 ? io_csr_13_dataIn : _GEN_48; // @[CSR.scala 40:45:@552.4]
  assign _T_327 = _T_321 & io_bus_write; // @[CSR.scala 47:30:@560.4]
  assign _T_332 = io_bus_addr == 4'he; // @[CSR.scala 40:22:@569.4]
  assign _T_333 = _T_332 & io_bus_read; // @[CSR.scala 40:30:@570.4]
  assign _GEN_56 = _T_333 ? io_csr_14_dataIn : _GEN_52; // @[CSR.scala 40:45:@571.4]
  assign _T_338 = _T_332 & io_bus_write; // @[CSR.scala 47:30:@579.4]
  assign _T_343 = io_bus_addr == 4'hf; // @[CSR.scala 40:22:@588.4]
  assign _T_344 = _T_343 & io_bus_read; // @[CSR.scala 40:30:@589.4]
  assign _T_349 = _T_343 & io_bus_write; // @[CSR.scala 47:30:@598.4]
  assign io_csr_0_dataOut = _T_184 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@315.6 CSR.scala 52:25:@320.6]
  assign io_csr_0_dataWrite = _T_178 & io_bus_write; // @[CSR.scala 49:27:@316.6 CSR.scala 51:27:@319.6]
  assign io_csr_2_dataOut = _T_206 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@353.6 CSR.scala 52:25:@358.6]
  assign io_csr_2_dataWrite = _T_200 & io_bus_write; // @[CSR.scala 49:27:@354.6 CSR.scala 51:27:@357.6]
  assign io_csr_3_dataOut = _T_217 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@372.6 CSR.scala 52:25:@377.6]
  assign io_csr_3_dataWrite = _T_211 & io_bus_write; // @[CSR.scala 49:27:@373.6 CSR.scala 51:27:@376.6]
  assign io_csr_4_dataOut = _T_228 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@391.6 CSR.scala 52:25:@396.6]
  assign io_csr_4_dataWrite = _T_222 & io_bus_write; // @[CSR.scala 49:27:@392.6 CSR.scala 51:27:@395.6]
  assign io_csr_5_dataOut = _T_239 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@410.6 CSR.scala 52:25:@415.6]
  assign io_csr_5_dataWrite = _T_233 & io_bus_write; // @[CSR.scala 49:27:@411.6 CSR.scala 51:27:@414.6]
  assign io_csr_6_dataOut = _T_250 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@429.6 CSR.scala 52:25:@434.6]
  assign io_csr_6_dataWrite = _T_244 & io_bus_write; // @[CSR.scala 49:27:@430.6 CSR.scala 51:27:@433.6]
  assign io_csr_7_dataOut = _T_261 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@448.6 CSR.scala 52:25:@453.6]
  assign io_csr_7_dataWrite = _T_255 & io_bus_write; // @[CSR.scala 49:27:@449.6 CSR.scala 51:27:@452.6]
  assign io_csr_8_dataOut = _T_272 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@467.6 CSR.scala 52:25:@472.6]
  assign io_csr_8_dataWrite = _T_266 & io_bus_write; // @[CSR.scala 49:27:@468.6 CSR.scala 51:27:@471.6]
  assign io_csr_9_dataOut = _T_283 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@486.6 CSR.scala 52:25:@491.6]
  assign io_csr_9_dataWrite = _T_277 & io_bus_write; // @[CSR.scala 49:27:@487.6 CSR.scala 51:27:@490.6]
  assign io_csr_10_dataOut = _T_294 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@505.6 CSR.scala 52:25:@510.6]
  assign io_csr_10_dataWrite = _T_288 & io_bus_write; // @[CSR.scala 49:27:@506.6 CSR.scala 51:27:@509.6]
  assign io_csr_11_dataOut = _T_305 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@524.6 CSR.scala 52:25:@529.6]
  assign io_csr_11_dataWrite = _T_299 & io_bus_write; // @[CSR.scala 49:27:@525.6 CSR.scala 51:27:@528.6]
  assign io_csr_12_dataOut = _T_316 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@543.6 CSR.scala 52:25:@548.6]
  assign io_csr_12_dataWrite = _T_310 & io_bus_write; // @[CSR.scala 49:27:@544.6 CSR.scala 51:27:@547.6]
  assign io_csr_13_dataOut = _T_327 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@562.6 CSR.scala 52:25:@567.6]
  assign io_csr_13_dataWrite = _T_321 & io_bus_write; // @[CSR.scala 49:27:@563.6 CSR.scala 51:27:@566.6]
  assign io_csr_14_dataOut = _T_338 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@581.6 CSR.scala 52:25:@586.6]
  assign io_csr_14_dataWrite = _T_332 & io_bus_write; // @[CSR.scala 49:27:@582.6 CSR.scala 51:27:@585.6]
  assign io_csr_15_dataOut = _T_349 ? io_bus_dataOut : 32'h0; // @[CSR.scala 48:25:@600.6 CSR.scala 52:25:@605.6]
  assign io_csr_15_dataWrite = _T_343 & io_bus_write; // @[CSR.scala 49:27:@601.6 CSR.scala 51:27:@604.6]
  assign io_bus_dataIn = _T_344 ? io_csr_15_dataIn : _GEN_56; // @[CSR.scala 37:17:@302.4]
endmodule
module AddressGenerator( // @[:@608.2]
  input         clock, // @[:@609.4]
  input         reset, // @[:@610.4]
  input         io_ctl_start, // @[:@611.4]
  output        io_ctl_busy, // @[:@611.4]
  input  [31:0] io_ctl_startAddress, // @[:@611.4]
  input  [31:0] io_ctl_lineLength, // @[:@611.4]
  input  [31:0] io_ctl_lineCount, // @[:@611.4]
  input  [31:0] io_ctl_lineGap, // @[:@611.4]
  input         io_xfer_done, // @[:@611.4]
  output [31:0] io_xfer_address, // @[:@611.4]
  output [31:0] io_xfer_length, // @[:@611.4]
  output        io_xfer_valid // @[:@611.4]
);
  reg [1:0] state; // @[AddressGenerator.scala 37:22:@613.4]
  reg [31:0] _RAND_0;
  reg [31:0] lineCount; // @[AddressGenerator.scala 39:26:@614.4]
  reg [31:0] _RAND_1;
  reg [31:0] lineGap; // @[AddressGenerator.scala 40:24:@615.4]
  reg [31:0] _RAND_2;
  reg [31:0] address_o; // @[AddressGenerator.scala 42:26:@616.4]
  reg [31:0] _RAND_3;
  reg [31:0] address_i; // @[AddressGenerator.scala 43:26:@617.4]
  reg [31:0] _RAND_4;
  reg [31:0] length_o; // @[AddressGenerator.scala 44:25:@618.4]
  reg [31:0] _RAND_5;
  reg [31:0] length_i; // @[AddressGenerator.scala 45:25:@619.4]
  reg [31:0] _RAND_6;
  reg  valid; // @[AddressGenerator.scala 46:22:@620.4]
  reg [31:0] _RAND_7;
  reg  busy; // @[AddressGenerator.scala 47:21:@621.4]
  reg [31:0] _RAND_8;
  wire  _T_42; // @[AddressGenerator.scala 54:14:@626.4]
  wire  _GEN_0; // @[AddressGenerator.scala 54:24:@627.4]
  wire  _T_45; // @[Conditional.scala 37:30:@633.4]
  wire [1:0] _GEN_1; // @[AddressGenerator.scala 62:25:@635.6]
  wire [31:0] _GEN_2; // @[AddressGenerator.scala 62:25:@635.6]
  wire [31:0] _GEN_3; // @[AddressGenerator.scala 62:25:@635.6]
  wire [31:0] _GEN_4; // @[AddressGenerator.scala 62:25:@635.6]
  wire [31:0] _GEN_5; // @[AddressGenerator.scala 62:25:@635.6]
  wire  _T_46; // @[Conditional.scala 37:30:@644.6]
  wire [35:0] _T_49; // @[AddressGenerator.scala 75:42:@649.8]
  wire [35:0] _GEN_24; // @[AddressGenerator.scala 75:30:@650.8]
  wire [36:0] _T_50; // @[AddressGenerator.scala 75:30:@650.8]
  wire [35:0] _T_51; // @[AddressGenerator.scala 75:30:@651.8]
  wire [35:0] _T_53; // @[AddressGenerator.scala 75:74:@652.8]
  wire [36:0] _T_54; // @[AddressGenerator.scala 75:63:@653.8]
  wire [35:0] _T_55; // @[AddressGenerator.scala 75:63:@654.8]
  wire [32:0] _T_57; // @[AddressGenerator.scala 77:30:@656.8]
  wire [32:0] _T_58; // @[AddressGenerator.scala 77:30:@657.8]
  wire [31:0] _T_59; // @[AddressGenerator.scala 77:30:@658.8]
  wire  _T_60; // @[Conditional.scala 37:30:@663.8]
  wire  _T_63; // @[AddressGenerator.scala 83:24:@667.12]
  wire [1:0] _GEN_6; // @[AddressGenerator.scala 83:30:@668.12]
  wire [1:0] _GEN_7; // @[AddressGenerator.scala 82:25:@666.10]
  wire  _GEN_8; // @[Conditional.scala 39:67:@664.8]
  wire [1:0] _GEN_9; // @[Conditional.scala 39:67:@664.8]
  wire  _GEN_10; // @[Conditional.scala 39:67:@645.6]
  wire [31:0] _GEN_11; // @[Conditional.scala 39:67:@645.6]
  wire [31:0] _GEN_12; // @[Conditional.scala 39:67:@645.6]
  wire [35:0] _GEN_13; // @[Conditional.scala 39:67:@645.6]
  wire [31:0] _GEN_14; // @[Conditional.scala 39:67:@645.6]
  wire [1:0] _GEN_15; // @[Conditional.scala 39:67:@645.6]
  wire [1:0] _GEN_16; // @[Conditional.scala 40:58:@634.4]
  wire [35:0] _GEN_17; // @[Conditional.scala 40:58:@634.4]
  wire [31:0] _GEN_18; // @[Conditional.scala 40:58:@634.4]
  wire [31:0] _GEN_19; // @[Conditional.scala 40:58:@634.4]
  wire [31:0] _GEN_20; // @[Conditional.scala 40:58:@634.4]
  wire  _GEN_21; // @[Conditional.scala 40:58:@634.4]
  wire [31:0] _GEN_22; // @[Conditional.scala 40:58:@634.4]
  wire [31:0] _GEN_23; // @[Conditional.scala 40:58:@634.4]
  assign _T_42 = state == 2'h0; // @[AddressGenerator.scala 54:14:@626.4]
  assign _GEN_0 = _T_42 ? 1'h0 : 1'h1; // @[AddressGenerator.scala 54:24:@627.4]
  assign _T_45 = 2'h0 == state; // @[Conditional.scala 37:30:@633.4]
  assign _GEN_1 = io_ctl_start ? 2'h1 : state; // @[AddressGenerator.scala 62:25:@635.6]
  assign _GEN_2 = io_ctl_start ? io_ctl_startAddress : address_i; // @[AddressGenerator.scala 62:25:@635.6]
  assign _GEN_3 = io_ctl_start ? io_ctl_lineLength : length_i; // @[AddressGenerator.scala 62:25:@635.6]
  assign _GEN_4 = io_ctl_start ? io_ctl_lineCount : lineCount; // @[AddressGenerator.scala 62:25:@635.6]
  assign _GEN_5 = io_ctl_start ? io_ctl_lineGap : lineGap; // @[AddressGenerator.scala 62:25:@635.6]
  assign _T_46 = 2'h1 == state; // @[Conditional.scala 37:30:@644.6]
  assign _T_49 = length_i * 32'h8; // @[AddressGenerator.scala 75:42:@649.8]
  assign _GEN_24 = {{4'd0}, address_i}; // @[AddressGenerator.scala 75:30:@650.8]
  assign _T_50 = _GEN_24 + _T_49; // @[AddressGenerator.scala 75:30:@650.8]
  assign _T_51 = _GEN_24 + _T_49; // @[AddressGenerator.scala 75:30:@651.8]
  assign _T_53 = lineGap * 32'h8; // @[AddressGenerator.scala 75:74:@652.8]
  assign _T_54 = _T_51 + _T_53; // @[AddressGenerator.scala 75:63:@653.8]
  assign _T_55 = _T_51 + _T_53; // @[AddressGenerator.scala 75:63:@654.8]
  assign _T_57 = lineCount - 32'h1; // @[AddressGenerator.scala 77:30:@656.8]
  assign _T_58 = $unsigned(_T_57); // @[AddressGenerator.scala 77:30:@657.8]
  assign _T_59 = _T_58[31:0]; // @[AddressGenerator.scala 77:30:@658.8]
  assign _T_60 = 2'h2 == state; // @[Conditional.scala 37:30:@663.8]
  assign _T_63 = lineCount > 32'h0; // @[AddressGenerator.scala 83:24:@667.12]
  assign _GEN_6 = _T_63 ? 2'h1 : 2'h0; // @[AddressGenerator.scala 83:30:@668.12]
  assign _GEN_7 = io_xfer_done ? _GEN_6 : state; // @[AddressGenerator.scala 82:25:@666.10]
  assign _GEN_8 = _T_60 ? 1'h0 : valid; // @[Conditional.scala 39:67:@664.8]
  assign _GEN_9 = _T_60 ? _GEN_7 : state; // @[Conditional.scala 39:67:@664.8]
  assign _GEN_10 = _T_46 ? 1'h1 : _GEN_8; // @[Conditional.scala 39:67:@645.6]
  assign _GEN_11 = _T_46 ? address_i : address_o; // @[Conditional.scala 39:67:@645.6]
  assign _GEN_12 = _T_46 ? length_i : length_o; // @[Conditional.scala 39:67:@645.6]
  assign _GEN_13 = _T_46 ? _T_55 : {{4'd0}, address_i}; // @[Conditional.scala 39:67:@645.6]
  assign _GEN_14 = _T_46 ? _T_59 : lineCount; // @[Conditional.scala 39:67:@645.6]
  assign _GEN_15 = _T_46 ? 2'h2 : _GEN_9; // @[Conditional.scala 39:67:@645.6]
  assign _GEN_16 = _T_45 ? _GEN_1 : _GEN_15; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_17 = _T_45 ? {{4'd0}, _GEN_2} : _GEN_13; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_18 = _T_45 ? _GEN_3 : length_i; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_19 = _T_45 ? _GEN_4 : _GEN_14; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_20 = _T_45 ? _GEN_5 : lineGap; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_21 = _T_45 ? valid : _GEN_10; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_22 = _T_45 ? address_o : _GEN_11; // @[Conditional.scala 40:58:@634.4]
  assign _GEN_23 = _T_45 ? length_o : _GEN_12; // @[Conditional.scala 40:58:@634.4]
  assign io_ctl_busy = busy; // @[AddressGenerator.scala 52:15:@625.4]
  assign io_xfer_address = address_o; // @[AddressGenerator.scala 49:19:@622.4]
  assign io_xfer_length = length_o; // @[AddressGenerator.scala 50:18:@623.4]
  assign io_xfer_valid = valid; // @[AddressGenerator.scala 51:17:@624.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  lineCount = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  lineGap = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  address_o = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  address_i = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  length_o = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  length_i = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  busy = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_45) begin
        if (io_ctl_start) begin
          state <= 2'h1;
        end
      end else begin
        if (_T_46) begin
          state <= 2'h2;
        end else begin
          if (_T_60) begin
            if (io_xfer_done) begin
              if (_T_63) begin
                state <= 2'h1;
              end else begin
                state <= 2'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      lineCount <= 32'h0;
    end else begin
      if (_T_45) begin
        if (io_ctl_start) begin
          lineCount <= io_ctl_lineCount;
        end
      end else begin
        if (_T_46) begin
          lineCount <= _T_59;
        end
      end
    end
    if (reset) begin
      lineGap <= 32'h0;
    end else begin
      if (_T_45) begin
        if (io_ctl_start) begin
          lineGap <= io_ctl_lineGap;
        end
      end
    end
    if (reset) begin
      address_o <= 32'h0;
    end else begin
      if (!(_T_45)) begin
        if (_T_46) begin
          address_o <= address_i;
        end
      end
    end
    if (reset) begin
      address_i <= 32'h0;
    end else begin
      address_i <= _GEN_17[31:0];
    end
    if (reset) begin
      length_o <= 32'h0;
    end else begin
      if (!(_T_45)) begin
        if (_T_46) begin
          length_o <= length_i;
        end
      end
    end
    if (reset) begin
      length_i <= 32'h0;
    end else begin
      if (_T_45) begin
        if (io_ctl_start) begin
          length_i <= io_ctl_lineLength;
        end
      end
    end
    if (reset) begin
      valid <= 1'h0;
    end else begin
      if (!(_T_45)) begin
        if (_T_46) begin
          valid <= 1'h1;
        end else begin
          if (_T_60) begin
            valid <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      busy <= 1'h0;
    end else begin
      if (_T_42) begin
        busy <= 1'h0;
      end else begin
        busy <= 1'h1;
      end
    end
  end
endmodule
module TransferSplitter( // @[:@677.2]
  input         clock, // @[:@678.4]
  input         reset, // @[:@679.4]
  output        io_xferIn_done, // @[:@680.4]
  input  [31:0] io_xferIn_address, // @[:@680.4]
  input  [31:0] io_xferIn_length, // @[:@680.4]
  input         io_xferIn_valid, // @[:@680.4]
  input         io_xferOut_done, // @[:@680.4]
  output [31:0] io_xferOut_address, // @[:@680.4]
  output [31:0] io_xferOut_length, // @[:@680.4]
  output        io_xferOut_valid // @[:@680.4]
);
  reg [31:0] _T_36; // @[TransferSplitter.scala 43:28:@682.4]
  reg [31:0] _RAND_0;
  reg [31:0] _T_39; // @[TransferSplitter.scala 44:27:@683.4]
  reg [31:0] _RAND_1;
  reg [31:0] _T_42; // @[TransferSplitter.scala 46:28:@684.4]
  reg [31:0] _RAND_2;
  reg [31:0] _T_45; // @[TransferSplitter.scala 47:27:@685.4]
  reg [31:0] _RAND_3;
  reg  _T_48; // @[TransferSplitter.scala 49:23:@686.4]
  reg [31:0] _RAND_4;
  reg  _T_51; // @[TransferSplitter.scala 50:24:@687.4]
  reg [31:0] _RAND_5;
  reg [1:0] _T_53; // @[TransferSplitter.scala 52:24:@688.4]
  reg [31:0] _RAND_6;
  wire  _T_54; // @[Conditional.scala 37:30:@693.4]
  wire [31:0] _GEN_0; // @[TransferSplitter.scala 64:31:@696.6]
  wire [31:0] _GEN_1; // @[TransferSplitter.scala 64:31:@696.6]
  wire [1:0] _GEN_2; // @[TransferSplitter.scala 64:31:@696.6]
  wire  _T_56; // @[Conditional.scala 37:30:@703.6]
  wire  _T_59; // @[TransferSplitter.scala 75:23:@708.8]
  wire [32:0] _T_62; // @[TransferSplitter.scala 78:34:@711.10]
  wire [32:0] _T_63; // @[TransferSplitter.scala 78:34:@712.10]
  wire [31:0] _T_64; // @[TransferSplitter.scala 78:34:@713.10]
  wire [12:0] _T_67; // @[TransferSplitter.scala 79:50:@715.10]
  wire [31:0] _GEN_27; // @[TransferSplitter.scala 79:36:@716.10]
  wire [32:0] _T_68; // @[TransferSplitter.scala 79:36:@716.10]
  wire [31:0] _T_69; // @[TransferSplitter.scala 79:36:@717.10]
  wire [35:0] _T_72; // @[TransferSplitter.scala 97:47:@723.10]
  wire [35:0] _GEN_28; // @[TransferSplitter.scala 97:36:@724.10]
  wire [36:0] _T_73; // @[TransferSplitter.scala 97:36:@724.10]
  wire [35:0] _T_74; // @[TransferSplitter.scala 97:36:@725.10]
  wire [31:0] _GEN_3; // @[TransferSplitter.scala 75:38:@709.8]
  wire [31:0] _GEN_4; // @[TransferSplitter.scala 75:38:@709.8]
  wire [35:0] _GEN_5; // @[TransferSplitter.scala 75:38:@709.8]
  wire  _T_75; // @[Conditional.scala 37:30:@730.8]
  wire  _T_78; // @[TransferSplitter.scala 115:25:@734.12]
  wire [1:0] _GEN_6; // @[TransferSplitter.scala 115:32:@735.12]
  wire  _GEN_7; // @[TransferSplitter.scala 115:32:@735.12]
  wire [1:0] _GEN_8; // @[TransferSplitter.scala 114:31:@733.10]
  wire  _GEN_9; // @[TransferSplitter.scala 114:31:@733.10]
  wire  _GEN_10; // @[Conditional.scala 39:67:@731.8]
  wire [1:0] _GEN_11; // @[Conditional.scala 39:67:@731.8]
  wire  _GEN_12; // @[Conditional.scala 39:67:@731.8]
  wire [31:0] _GEN_13; // @[Conditional.scala 39:67:@704.6]
  wire  _GEN_14; // @[Conditional.scala 39:67:@704.6]
  wire [1:0] _GEN_15; // @[Conditional.scala 39:67:@704.6]
  wire [31:0] _GEN_16; // @[Conditional.scala 39:67:@704.6]
  wire [31:0] _GEN_17; // @[Conditional.scala 39:67:@704.6]
  wire [35:0] _GEN_18; // @[Conditional.scala 39:67:@704.6]
  wire  _GEN_19; // @[Conditional.scala 39:67:@704.6]
  wire  _GEN_20; // @[Conditional.scala 40:58:@694.4]
  wire [35:0] _GEN_21; // @[Conditional.scala 40:58:@694.4]
  wire [31:0] _GEN_22; // @[Conditional.scala 40:58:@694.4]
  wire [1:0] _GEN_23; // @[Conditional.scala 40:58:@694.4]
  wire [31:0] _GEN_24; // @[Conditional.scala 40:58:@694.4]
  wire  _GEN_25; // @[Conditional.scala 40:58:@694.4]
  wire [31:0] _GEN_26; // @[Conditional.scala 40:58:@694.4]
  assign _T_54 = 2'h0 == _T_53; // @[Conditional.scala 37:30:@693.4]
  assign _GEN_0 = io_xferIn_valid ? io_xferIn_address : _T_36; // @[TransferSplitter.scala 64:31:@696.6]
  assign _GEN_1 = io_xferIn_valid ? io_xferIn_length : _T_39; // @[TransferSplitter.scala 64:31:@696.6]
  assign _GEN_2 = io_xferIn_valid ? 2'h1 : _T_53; // @[TransferSplitter.scala 64:31:@696.6]
  assign _T_56 = 2'h1 == _T_53; // @[Conditional.scala 37:30:@703.6]
  assign _T_59 = _T_39 > 32'h100; // @[TransferSplitter.scala 75:23:@708.8]
  assign _T_62 = _T_39 - 32'h100; // @[TransferSplitter.scala 78:34:@711.10]
  assign _T_63 = $unsigned(_T_62); // @[TransferSplitter.scala 78:34:@712.10]
  assign _T_64 = _T_63[31:0]; // @[TransferSplitter.scala 78:34:@713.10]
  assign _T_67 = 9'h100 * 9'h8; // @[TransferSplitter.scala 79:50:@715.10]
  assign _GEN_27 = {{19'd0}, _T_67}; // @[TransferSplitter.scala 79:36:@716.10]
  assign _T_68 = _T_36 + _GEN_27; // @[TransferSplitter.scala 79:36:@716.10]
  assign _T_69 = _T_36 + _GEN_27; // @[TransferSplitter.scala 79:36:@717.10]
  assign _T_72 = _T_39 * 32'h8; // @[TransferSplitter.scala 97:47:@723.10]
  assign _GEN_28 = {{4'd0}, _T_36}; // @[TransferSplitter.scala 97:36:@724.10]
  assign _T_73 = _GEN_28 + _T_72; // @[TransferSplitter.scala 97:36:@724.10]
  assign _T_74 = _GEN_28 + _T_72; // @[TransferSplitter.scala 97:36:@725.10]
  assign _GEN_3 = _T_59 ? 32'h100 : _T_39; // @[TransferSplitter.scala 75:38:@709.8]
  assign _GEN_4 = _T_59 ? _T_64 : 32'h0; // @[TransferSplitter.scala 75:38:@709.8]
  assign _GEN_5 = _T_59 ? {{4'd0}, _T_69} : _T_74; // @[TransferSplitter.scala 75:38:@709.8]
  assign _T_75 = 2'h2 == _T_53; // @[Conditional.scala 37:30:@730.8]
  assign _T_78 = _T_39 > 32'h0; // @[TransferSplitter.scala 115:25:@734.12]
  assign _GEN_6 = _T_78 ? 2'h1 : 2'h0; // @[TransferSplitter.scala 115:32:@735.12]
  assign _GEN_7 = _T_78 ? _T_48 : 1'h1; // @[TransferSplitter.scala 115:32:@735.12]
  assign _GEN_8 = io_xferOut_done ? _GEN_6 : _T_53; // @[TransferSplitter.scala 114:31:@733.10]
  assign _GEN_9 = io_xferOut_done ? _GEN_7 : _T_48; // @[TransferSplitter.scala 114:31:@733.10]
  assign _GEN_10 = _T_75 ? 1'h0 : _T_51; // @[Conditional.scala 39:67:@731.8]
  assign _GEN_11 = _T_75 ? _GEN_8 : _T_53; // @[Conditional.scala 39:67:@731.8]
  assign _GEN_12 = _T_75 ? _GEN_9 : _T_48; // @[Conditional.scala 39:67:@731.8]
  assign _GEN_13 = _T_56 ? _T_36 : _T_42; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_14 = _T_56 ? 1'h1 : _GEN_10; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_15 = _T_56 ? 2'h2 : _GEN_11; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_16 = _T_56 ? _GEN_3 : _T_45; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_17 = _T_56 ? _GEN_4 : _T_39; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_18 = _T_56 ? _GEN_5 : {{4'd0}, _T_36}; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_19 = _T_56 ? _T_48 : _GEN_12; // @[Conditional.scala 39:67:@704.6]
  assign _GEN_20 = _T_54 ? 1'h0 : _GEN_19; // @[Conditional.scala 40:58:@694.4]
  assign _GEN_21 = _T_54 ? {{4'd0}, _GEN_0} : _GEN_18; // @[Conditional.scala 40:58:@694.4]
  assign _GEN_22 = _T_54 ? _GEN_1 : _GEN_17; // @[Conditional.scala 40:58:@694.4]
  assign _GEN_23 = _T_54 ? _GEN_2 : _GEN_15; // @[Conditional.scala 40:58:@694.4]
  assign _GEN_24 = _T_54 ? _T_42 : _GEN_13; // @[Conditional.scala 40:58:@694.4]
  assign _GEN_25 = _T_54 ? _T_51 : _GEN_14; // @[Conditional.scala 40:58:@694.4]
  assign _GEN_26 = _T_54 ? _T_45 : _GEN_16; // @[Conditional.scala 40:58:@694.4]
  assign io_xferIn_done = _T_48; // @[TransferSplitter.scala 54:20:@689.4]
  assign io_xferOut_address = _T_42; // @[TransferSplitter.scala 57:24:@691.4]
  assign io_xferOut_length = _T_45; // @[TransferSplitter.scala 58:23:@692.4]
  assign io_xferOut_valid = _T_51; // @[TransferSplitter.scala 55:22:@690.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_36 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_39 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_42 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_45 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_48 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_51 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_53 = _RAND_6[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_36 <= 32'h0;
    end else begin
      _T_36 <= _GEN_21[31:0];
    end
    if (reset) begin
      _T_39 <= 32'h0;
    end else begin
      if (_T_54) begin
        if (io_xferIn_valid) begin
          _T_39 <= io_xferIn_length;
        end
      end else begin
        if (_T_56) begin
          if (_T_59) begin
            _T_39 <= _T_64;
          end else begin
            _T_39 <= 32'h0;
          end
        end
      end
    end
    if (reset) begin
      _T_42 <= 32'h0;
    end else begin
      if (!(_T_54)) begin
        if (_T_56) begin
          _T_42 <= _T_36;
        end
      end
    end
    if (reset) begin
      _T_45 <= 32'h0;
    end else begin
      if (!(_T_54)) begin
        if (_T_56) begin
          if (_T_59) begin
            _T_45 <= 32'h100;
          end else begin
            _T_45 <= _T_39;
          end
        end
      end
    end
    if (reset) begin
      _T_48 <= 1'h0;
    end else begin
      if (_T_54) begin
        _T_48 <= 1'h0;
      end else begin
        if (!(_T_56)) begin
          if (_T_75) begin
            if (io_xferOut_done) begin
              if (!(_T_78)) begin
                _T_48 <= 1'h1;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      _T_51 <= 1'h0;
    end else begin
      if (!(_T_54)) begin
        if (_T_56) begin
          _T_51 <= 1'h1;
        end else begin
          if (_T_75) begin
            _T_51 <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      _T_53 <= 2'h0;
    end else begin
      if (_T_54) begin
        if (io_xferIn_valid) begin
          _T_53 <= 2'h1;
        end
      end else begin
        if (_T_56) begin
          _T_53 <= 2'h2;
        end else begin
          if (_T_75) begin
            if (io_xferOut_done) begin
              if (_T_78) begin
                _T_53 <= 2'h1;
              end else begin
                _T_53 <= 2'h0;
              end
            end
          end
        end
      end
    end
  end
endmodule
module TransferSplitter_1( // @[:@814.2]
  output        io_xferIn_done, // @[:@817.4]
  input  [31:0] io_xferIn_length, // @[:@817.4]
  input         io_xferIn_valid, // @[:@817.4]
  input         io_xferOut_done, // @[:@817.4]
  output [31:0] io_xferOut_length, // @[:@817.4]
  output        io_xferOut_valid // @[:@817.4]
);
  assign io_xferIn_done = io_xferOut_done; // @[TransferSplitter.scala 125:16:@822.4]
  assign io_xferOut_length = io_xferIn_length; // @[TransferSplitter.scala 125:16:@820.4]
  assign io_xferOut_valid = io_xferIn_valid; // @[TransferSplitter.scala 125:16:@819.4]
endmodule
module ClearCSR( // @[:@824.2]
  input         clock, // @[:@825.4]
  input         reset, // @[:@826.4]
  input  [31:0] io_csr_dataOut, // @[:@827.4]
  input         io_csr_dataWrite, // @[:@827.4]
  output [31:0] io_csr_dataIn, // @[:@827.4]
  output [31:0] io_value, // @[:@827.4]
  input  [31:0] io_clear // @[:@827.4]
);
  reg [31:0] reg$; // @[ClearCSR.scala 36:20:@829.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[ClearCSR.scala 44:19:@836.6]
  wire [31:0] _T_30; // @[ClearCSR.scala 44:16:@837.6]
  wire [31:0] _GEN_0; // @[ClearCSR.scala 41:25:@832.4]
  assign _T_29 = ~ io_clear; // @[ClearCSR.scala 44:19:@836.6]
  assign _T_30 = reg$ & _T_29; // @[ClearCSR.scala 44:16:@837.6]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : _T_30; // @[ClearCSR.scala 41:25:@832.4]
  assign io_csr_dataIn = reg$; // @[ClearCSR.scala 38:17:@830.4]
  assign io_value = reg$; // @[ClearCSR.scala 39:12:@831.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= io_csr_dataOut;
      end else begin
        reg$ <= _T_30;
      end
    end
  end
endmodule
module StatusCSR( // @[:@841.2]
  input         clock, // @[:@842.4]
  output [31:0] io_csr_dataIn, // @[:@844.4]
  input  [31:0] io_value // @[:@844.4]
);
  reg [31:0] reg$; // @[StatusCSR.scala 35:20:@846.4]
  reg [31:0] _RAND_0;
  assign io_csr_dataIn = reg$; // @[StatusCSR.scala 37:17:@848.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    reg$ <= io_value;
  end
endmodule
module SimpleCSR( // @[:@850.2]
  input         clock, // @[:@851.4]
  input         reset, // @[:@852.4]
  input  [31:0] io_csr_dataOut, // @[:@853.4]
  input         io_csr_dataWrite, // @[:@853.4]
  output [31:0] io_csr_dataIn, // @[:@853.4]
  output [31:0] io_value // @[:@853.4]
);
  reg [31:0] reg$; // @[SimpleCSR.scala 35:20:@855.4]
  reg [31:0] _RAND_0;
  wire [31:0] _GEN_0; // @[SimpleCSR.scala 40:25:@858.4]
  assign _GEN_0 = io_csr_dataWrite ? io_csr_dataOut : reg$; // @[SimpleCSR.scala 40:25:@858.4]
  assign io_csr_dataIn = reg$; // @[SimpleCSR.scala 37:17:@856.4]
  assign io_value = reg$; // @[SimpleCSR.scala 38:12:@857.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= io_csr_dataOut;
      end
    end
  end
endmodule
module SetCSR( // @[:@862.2]
  input         clock, // @[:@863.4]
  input         reset, // @[:@864.4]
  input  [31:0] io_csr_dataOut, // @[:@865.4]
  input         io_csr_dataWrite, // @[:@865.4]
  output [31:0] io_csr_dataIn, // @[:@865.4]
  output [31:0] io_value, // @[:@865.4]
  input  [31:0] io_set // @[:@865.4]
);
  reg [31:0] reg$; // @[SetCSR.scala 36:20:@867.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_29; // @[SetCSR.scala 42:20:@871.6]
  wire [31:0] _T_30; // @[SetCSR.scala 42:17:@872.6]
  wire [31:0] _T_31; // @[SetCSR.scala 42:45:@873.6]
  wire [31:0] _T_32; // @[SetCSR.scala 44:16:@877.6]
  wire [31:0] _GEN_0; // @[SetCSR.scala 41:25:@870.4]
  assign _T_29 = ~ io_csr_dataOut; // @[SetCSR.scala 42:20:@871.6]
  assign _T_30 = reg$ & _T_29; // @[SetCSR.scala 42:17:@872.6]
  assign _T_31 = _T_30 | io_set; // @[SetCSR.scala 42:45:@873.6]
  assign _T_32 = reg$ | io_set; // @[SetCSR.scala 44:16:@877.6]
  assign _GEN_0 = io_csr_dataWrite ? _T_31 : _T_32; // @[SetCSR.scala 41:25:@870.4]
  assign io_csr_dataIn = reg$; // @[SetCSR.scala 38:17:@868.4]
  assign io_value = reg$; // @[SetCSR.scala 39:12:@869.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      reg$ <= 32'h0;
    end else begin
      if (io_csr_dataWrite) begin
        reg$ <= _T_31;
      end else begin
        reg$ <= _T_32;
      end
    end
  end
endmodule
module InterruptController( // @[:@881.2]
  input         clock, // @[:@882.4]
  input         reset, // @[:@883.4]
  output        io_irq_readerDone, // @[:@884.4]
  output        io_irq_writerDone, // @[:@884.4]
  input         io_readBusy, // @[:@884.4]
  input         io_writeBusy, // @[:@884.4]
  input  [31:0] io_imr_dataOut, // @[:@884.4]
  input         io_imr_dataWrite, // @[:@884.4]
  output [31:0] io_imr_dataIn, // @[:@884.4]
  input  [31:0] io_isr_dataOut, // @[:@884.4]
  input         io_isr_dataWrite, // @[:@884.4]
  output [31:0] io_isr_dataIn // @[:@884.4]
);
  wire  SimpleCSR_clock; // @[SimpleCSR.scala 48:21:@886.4]
  wire  SimpleCSR_reset; // @[SimpleCSR.scala 48:21:@886.4]
  wire [31:0] SimpleCSR_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@886.4]
  wire  SimpleCSR_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@886.4]
  wire [31:0] SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@886.4]
  wire [31:0] SimpleCSR_io_value; // @[SimpleCSR.scala 48:21:@886.4]
  wire  SetCSR_clock; // @[SetCSR.scala 51:21:@918.4]
  wire  SetCSR_reset; // @[SetCSR.scala 51:21:@918.4]
  wire [31:0] SetCSR_io_csr_dataOut; // @[SetCSR.scala 51:21:@918.4]
  wire  SetCSR_io_csr_dataWrite; // @[SetCSR.scala 51:21:@918.4]
  wire [31:0] SetCSR_io_csr_dataIn; // @[SetCSR.scala 51:21:@918.4]
  wire [31:0] SetCSR_io_value; // @[SetCSR.scala 51:21:@918.4]
  wire [31:0] SetCSR_io_set; // @[SetCSR.scala 51:21:@918.4]
  reg  readBusy; // @[InterruptController.scala 41:25:@895.4]
  reg [31:0] _RAND_0;
  reg  readBusyOld; // @[InterruptController.scala 42:28:@897.4]
  reg [31:0] _RAND_1;
  reg  writeBusy; // @[InterruptController.scala 44:26:@899.4]
  reg [31:0] _RAND_2;
  reg  writeBusyOld; // @[InterruptController.scala 45:29:@901.4]
  reg [31:0] _RAND_3;
  reg  writeBusyIrq; // @[InterruptController.scala 47:29:@903.4]
  reg [31:0] _RAND_4;
  reg  readBusyIrq; // @[InterruptController.scala 48:28:@904.4]
  reg [31:0] _RAND_5;
  wire  _T_59; // @[InterruptController.scala 50:35:@905.4]
  wire  _T_60; // @[InterruptController.scala 50:32:@906.4]
  wire [31:0] mask; // @[:@893.4 :@894.4]
  wire  _T_61; // @[InterruptController.scala 50:53:@907.4]
  wire  _T_62; // @[InterruptController.scala 50:46:@908.4]
  wire  _T_64; // @[InterruptController.scala 51:33:@910.4]
  wire  _T_65; // @[InterruptController.scala 51:30:@911.4]
  wire  _T_66; // @[InterruptController.scala 51:50:@912.4]
  wire  _T_67; // @[InterruptController.scala 51:43:@913.4]
  wire [1:0] irq; // @[Cat.scala 30:58:@915.4]
  wire [31:0] isr; // @[:@926.4 :@927.4]
  SimpleCSR SimpleCSR ( // @[SimpleCSR.scala 48:21:@886.4]
    .clock(SimpleCSR_clock),
    .reset(SimpleCSR_reset),
    .io_csr_dataOut(SimpleCSR_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_io_csr_dataIn),
    .io_value(SimpleCSR_io_value)
  );
  SetCSR SetCSR ( // @[SetCSR.scala 51:21:@918.4]
    .clock(SetCSR_clock),
    .reset(SetCSR_reset),
    .io_csr_dataOut(SetCSR_io_csr_dataOut),
    .io_csr_dataWrite(SetCSR_io_csr_dataWrite),
    .io_csr_dataIn(SetCSR_io_csr_dataIn),
    .io_value(SetCSR_io_value),
    .io_set(SetCSR_io_set)
  );
  assign _T_59 = writeBusy == 1'h0; // @[InterruptController.scala 50:35:@905.4]
  assign _T_60 = writeBusyOld & _T_59; // @[InterruptController.scala 50:32:@906.4]
  assign mask = SimpleCSR_io_value; // @[:@893.4 :@894.4]
  assign _T_61 = mask[0]; // @[InterruptController.scala 50:53:@907.4]
  assign _T_62 = _T_60 & _T_61; // @[InterruptController.scala 50:46:@908.4]
  assign _T_64 = readBusy == 1'h0; // @[InterruptController.scala 51:33:@910.4]
  assign _T_65 = readBusyOld & _T_64; // @[InterruptController.scala 51:30:@911.4]
  assign _T_66 = mask[1]; // @[InterruptController.scala 51:50:@912.4]
  assign _T_67 = _T_65 & _T_66; // @[InterruptController.scala 51:43:@913.4]
  assign irq = {readBusyIrq,writeBusyIrq}; // @[Cat.scala 30:58:@915.4]
  assign isr = SetCSR_io_value; // @[:@926.4 :@927.4]
  assign io_irq_readerDone = isr[1]; // @[InterruptController.scala 58:21:@931.4]
  assign io_irq_writerDone = isr[0]; // @[InterruptController.scala 57:21:@929.4]
  assign io_imr_dataIn = SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@889.4]
  assign io_isr_dataIn = SetCSR_io_csr_dataIn; // @[SetCSR.scala 55:16:@922.4]
  assign SimpleCSR_clock = clock; // @[:@887.4]
  assign SimpleCSR_reset = reset; // @[:@888.4]
  assign SimpleCSR_io_csr_dataOut = io_imr_dataOut; // @[SimpleCSR.scala 50:16:@891.4]
  assign SimpleCSR_io_csr_dataWrite = io_imr_dataWrite; // @[SimpleCSR.scala 50:16:@890.4]
  assign SetCSR_clock = clock; // @[:@919.4]
  assign SetCSR_reset = reset; // @[:@920.4]
  assign SetCSR_io_csr_dataOut = io_isr_dataOut; // @[SetCSR.scala 55:16:@924.4]
  assign SetCSR_io_csr_dataWrite = io_isr_dataWrite; // @[SetCSR.scala 55:16:@923.4]
  assign SetCSR_io_set = {{30'd0}, irq}; // @[SetCSR.scala 53:16:@921.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  readBusy = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readBusyOld = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  writeBusy = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  writeBusyOld = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  writeBusyIrq = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  readBusyIrq = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    readBusy <= io_readBusy;
    readBusyOld <= readBusy;
    writeBusy <= io_writeBusy;
    writeBusyOld <= writeBusy;
    if (reset) begin
      writeBusyIrq <= 1'h0;
    end else begin
      writeBusyIrq <= _T_62;
    end
    if (reset) begin
      readBusyIrq <= 1'h0;
    end else begin
      readBusyIrq <= _T_67;
    end
  end
endmodule
module WorkerCSRWrapper( // @[:@1077.2]
  input         clock, // @[:@1078.4]
  input         reset, // @[:@1079.4]
  input  [31:0] io_csr_0_dataOut, // @[:@1080.4]
  input         io_csr_0_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_0_dataIn, // @[:@1080.4]
  output [31:0] io_csr_1_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_2_dataOut, // @[:@1080.4]
  input         io_csr_2_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_2_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_3_dataOut, // @[:@1080.4]
  input         io_csr_3_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_3_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_4_dataOut, // @[:@1080.4]
  input         io_csr_4_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_4_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_5_dataOut, // @[:@1080.4]
  input         io_csr_5_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_5_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_6_dataOut, // @[:@1080.4]
  input         io_csr_6_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_6_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_7_dataOut, // @[:@1080.4]
  input         io_csr_7_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_7_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_8_dataOut, // @[:@1080.4]
  input         io_csr_8_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_8_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_9_dataOut, // @[:@1080.4]
  input         io_csr_9_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_9_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_10_dataOut, // @[:@1080.4]
  input         io_csr_10_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_10_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_11_dataOut, // @[:@1080.4]
  input         io_csr_11_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_11_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_12_dataOut, // @[:@1080.4]
  input         io_csr_12_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_12_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_13_dataOut, // @[:@1080.4]
  input         io_csr_13_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_13_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_14_dataOut, // @[:@1080.4]
  input         io_csr_14_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_14_dataIn, // @[:@1080.4]
  input  [31:0] io_csr_15_dataOut, // @[:@1080.4]
  input         io_csr_15_dataWrite, // @[:@1080.4]
  output [31:0] io_csr_15_dataIn, // @[:@1080.4]
  output        io_irq_readerDone, // @[:@1080.4]
  output        io_irq_writerDone, // @[:@1080.4]
  input         io_sync_readerSync, // @[:@1080.4]
  input         io_sync_writerSync, // @[:@1080.4]
  input         io_xferRead_done, // @[:@1080.4]
  output [31:0] io_xferRead_address, // @[:@1080.4]
  output [31:0] io_xferRead_length, // @[:@1080.4]
  output        io_xferRead_valid, // @[:@1080.4]
  input         io_xferWrite_done, // @[:@1080.4]
  output [31:0] io_xferWrite_length, // @[:@1080.4]
  output        io_xferWrite_valid // @[:@1080.4]
);
  wire  addressGeneratorRead_clock; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire  addressGeneratorRead_reset; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire  addressGeneratorRead_io_ctl_start; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire  addressGeneratorRead_io_ctl_busy; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire [31:0] addressGeneratorRead_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire [31:0] addressGeneratorRead_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire  addressGeneratorRead_io_xfer_done; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire [31:0] addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire [31:0] addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire  addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 41:36:@1082.4]
  wire  transferSplitterRead_clock; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire  transferSplitterRead_reset; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire  transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire [31:0] transferSplitterRead_io_xferIn_address; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire [31:0] transferSplitterRead_io_xferIn_length; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire  transferSplitterRead_io_xferIn_valid; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire  transferSplitterRead_io_xferOut_done; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire [31:0] transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire [31:0] transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire  transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 42:36:@1085.4]
  wire  addressGeneratorWrite_clock; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire  addressGeneratorWrite_reset; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire  addressGeneratorWrite_io_ctl_start; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire  addressGeneratorWrite_io_ctl_busy; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire [31:0] addressGeneratorWrite_io_ctl_startAddress; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineLength; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineCount; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire [31:0] addressGeneratorWrite_io_ctl_lineGap; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire  addressGeneratorWrite_io_xfer_done; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire [31:0] addressGeneratorWrite_io_xfer_address; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire [31:0] addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire  addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 44:37:@1088.4]
  wire  transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 45:37:@1091.4]
  wire [31:0] transferSplitterWrite_io_xferIn_length; // @[WorkerCSRWrapper.scala 45:37:@1091.4]
  wire  transferSplitterWrite_io_xferIn_valid; // @[WorkerCSRWrapper.scala 45:37:@1091.4]
  wire  transferSplitterWrite_io_xferOut_done; // @[WorkerCSRWrapper.scala 45:37:@1091.4]
  wire [31:0] transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 45:37:@1091.4]
  wire  transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 45:37:@1091.4]
  wire  ClearCSR_clock; // @[ClearCSR.scala 50:21:@1109.4]
  wire  ClearCSR_reset; // @[ClearCSR.scala 50:21:@1109.4]
  wire [31:0] ClearCSR_io_csr_dataOut; // @[ClearCSR.scala 50:21:@1109.4]
  wire  ClearCSR_io_csr_dataWrite; // @[ClearCSR.scala 50:21:@1109.4]
  wire [31:0] ClearCSR_io_csr_dataIn; // @[ClearCSR.scala 50:21:@1109.4]
  wire [31:0] ClearCSR_io_value; // @[ClearCSR.scala 50:21:@1109.4]
  wire [31:0] ClearCSR_io_clear; // @[ClearCSR.scala 50:21:@1109.4]
  wire  StatusCSR_clock; // @[StatusCSR.scala 42:21:@1118.4]
  wire [31:0] StatusCSR_io_csr_dataIn; // @[StatusCSR.scala 42:21:@1118.4]
  wire [31:0] StatusCSR_io_value; // @[StatusCSR.scala 42:21:@1118.4]
  wire  InterruptController_clock; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_reset; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_io_irq_readerDone; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_io_irq_writerDone; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_io_readBusy; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_io_writeBusy; // @[InterruptController.scala 63:22:@1126.4]
  wire [31:0] InterruptController_io_imr_dataOut; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_io_imr_dataWrite; // @[InterruptController.scala 63:22:@1126.4]
  wire [31:0] InterruptController_io_imr_dataIn; // @[InterruptController.scala 63:22:@1126.4]
  wire [31:0] InterruptController_io_isr_dataOut; // @[InterruptController.scala 63:22:@1126.4]
  wire  InterruptController_io_isr_dataWrite; // @[InterruptController.scala 63:22:@1126.4]
  wire [31:0] InterruptController_io_isr_dataIn; // @[InterruptController.scala 63:22:@1126.4]
  wire  SimpleCSR_clock; // @[SimpleCSR.scala 48:21:@1163.4]
  wire  SimpleCSR_reset; // @[SimpleCSR.scala 48:21:@1163.4]
  wire [31:0] SimpleCSR_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1163.4]
  wire  SimpleCSR_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1163.4]
  wire [31:0] SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1163.4]
  wire [31:0] SimpleCSR_io_value; // @[SimpleCSR.scala 48:21:@1163.4]
  wire  SimpleCSR_1_clock; // @[SimpleCSR.scala 48:21:@1171.4]
  wire  SimpleCSR_1_reset; // @[SimpleCSR.scala 48:21:@1171.4]
  wire [31:0] SimpleCSR_1_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1171.4]
  wire  SimpleCSR_1_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1171.4]
  wire [31:0] SimpleCSR_1_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1171.4]
  wire [31:0] SimpleCSR_1_io_value; // @[SimpleCSR.scala 48:21:@1171.4]
  wire  SimpleCSR_2_clock; // @[SimpleCSR.scala 48:21:@1179.4]
  wire  SimpleCSR_2_reset; // @[SimpleCSR.scala 48:21:@1179.4]
  wire [31:0] SimpleCSR_2_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1179.4]
  wire  SimpleCSR_2_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1179.4]
  wire [31:0] SimpleCSR_2_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1179.4]
  wire [31:0] SimpleCSR_2_io_value; // @[SimpleCSR.scala 48:21:@1179.4]
  wire  SimpleCSR_3_clock; // @[SimpleCSR.scala 48:21:@1187.4]
  wire  SimpleCSR_3_reset; // @[SimpleCSR.scala 48:21:@1187.4]
  wire [31:0] SimpleCSR_3_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1187.4]
  wire  SimpleCSR_3_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1187.4]
  wire [31:0] SimpleCSR_3_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1187.4]
  wire [31:0] SimpleCSR_3_io_value; // @[SimpleCSR.scala 48:21:@1187.4]
  wire  SimpleCSR_4_clock; // @[SimpleCSR.scala 48:21:@1196.4]
  wire  SimpleCSR_4_reset; // @[SimpleCSR.scala 48:21:@1196.4]
  wire [31:0] SimpleCSR_4_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1196.4]
  wire  SimpleCSR_4_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1196.4]
  wire [31:0] SimpleCSR_4_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1196.4]
  wire [31:0] SimpleCSR_4_io_value; // @[SimpleCSR.scala 48:21:@1196.4]
  wire  SimpleCSR_5_clock; // @[SimpleCSR.scala 48:21:@1204.4]
  wire  SimpleCSR_5_reset; // @[SimpleCSR.scala 48:21:@1204.4]
  wire [31:0] SimpleCSR_5_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1204.4]
  wire  SimpleCSR_5_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1204.4]
  wire [31:0] SimpleCSR_5_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1204.4]
  wire [31:0] SimpleCSR_5_io_value; // @[SimpleCSR.scala 48:21:@1204.4]
  wire  SimpleCSR_6_clock; // @[SimpleCSR.scala 48:21:@1212.4]
  wire  SimpleCSR_6_reset; // @[SimpleCSR.scala 48:21:@1212.4]
  wire [31:0] SimpleCSR_6_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1212.4]
  wire  SimpleCSR_6_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1212.4]
  wire [31:0] SimpleCSR_6_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1212.4]
  wire [31:0] SimpleCSR_6_io_value; // @[SimpleCSR.scala 48:21:@1212.4]
  wire  SimpleCSR_7_clock; // @[SimpleCSR.scala 48:21:@1220.4]
  wire  SimpleCSR_7_reset; // @[SimpleCSR.scala 48:21:@1220.4]
  wire [31:0] SimpleCSR_7_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1220.4]
  wire  SimpleCSR_7_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1220.4]
  wire [31:0] SimpleCSR_7_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1220.4]
  wire [31:0] SimpleCSR_7_io_value; // @[SimpleCSR.scala 48:21:@1220.4]
  wire  SimpleCSR_8_clock; // @[SimpleCSR.scala 48:21:@1228.4]
  wire  SimpleCSR_8_reset; // @[SimpleCSR.scala 48:21:@1228.4]
  wire [31:0] SimpleCSR_8_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1228.4]
  wire  SimpleCSR_8_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1228.4]
  wire [31:0] SimpleCSR_8_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1228.4]
  wire [31:0] SimpleCSR_8_io_value; // @[SimpleCSR.scala 48:21:@1228.4]
  wire  SimpleCSR_9_clock; // @[SimpleCSR.scala 48:21:@1235.4]
  wire  SimpleCSR_9_reset; // @[SimpleCSR.scala 48:21:@1235.4]
  wire [31:0] SimpleCSR_9_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1235.4]
  wire  SimpleCSR_9_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1235.4]
  wire [31:0] SimpleCSR_9_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1235.4]
  wire [31:0] SimpleCSR_9_io_value; // @[SimpleCSR.scala 48:21:@1235.4]
  wire  SimpleCSR_10_clock; // @[SimpleCSR.scala 48:21:@1242.4]
  wire  SimpleCSR_10_reset; // @[SimpleCSR.scala 48:21:@1242.4]
  wire [31:0] SimpleCSR_10_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1242.4]
  wire  SimpleCSR_10_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1242.4]
  wire [31:0] SimpleCSR_10_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1242.4]
  wire [31:0] SimpleCSR_10_io_value; // @[SimpleCSR.scala 48:21:@1242.4]
  wire  SimpleCSR_11_clock; // @[SimpleCSR.scala 48:21:@1249.4]
  wire  SimpleCSR_11_reset; // @[SimpleCSR.scala 48:21:@1249.4]
  wire [31:0] SimpleCSR_11_io_csr_dataOut; // @[SimpleCSR.scala 48:21:@1249.4]
  wire  SimpleCSR_11_io_csr_dataWrite; // @[SimpleCSR.scala 48:21:@1249.4]
  wire [31:0] SimpleCSR_11_io_csr_dataIn; // @[SimpleCSR.scala 48:21:@1249.4]
  wire [31:0] SimpleCSR_11_io_value; // @[SimpleCSR.scala 48:21:@1249.4]
  reg [1:0] status; // @[WorkerCSRWrapper.scala 47:23:@1095.4]
  reg [31:0] _RAND_0;
  reg  readerSync; // @[WorkerCSRWrapper.scala 49:27:@1097.4]
  reg [31:0] _RAND_1;
  reg  readerSyncOld; // @[WorkerCSRWrapper.scala 50:30:@1099.4]
  reg [31:0] _RAND_2;
  reg  writerSync; // @[WorkerCSRWrapper.scala 52:27:@1101.4]
  reg [31:0] _RAND_3;
  reg  writerSyncOld; // @[WorkerCSRWrapper.scala 53:30:@1103.4]
  reg [31:0] _RAND_4;
  reg  readerStart; // @[WorkerCSRWrapper.scala 55:28:@1105.4]
  reg [31:0] _RAND_5;
  reg  writerStart; // @[WorkerCSRWrapper.scala 56:28:@1106.4]
  reg [31:0] _RAND_6;
  wire [1:0] _T_199; // @[Cat.scala 30:58:@1141.4]
  wire [31:0] control; // @[WorkerCSRWrapper.scala 58:21:@1107.4 WorkerCSRWrapper.scala 61:11:@1117.4]
  wire  _T_200; // @[WorkerCSRWrapper.scala 68:56:@1142.4]
  wire  _T_201; // @[WorkerCSRWrapper.scala 68:68:@1143.4]
  wire [1:0] _T_202; // @[Cat.scala 30:58:@1144.4]
  wire [1:0] _T_203; // @[WorkerCSRWrapper.scala 68:44:@1145.4]
  wire [1:0] clear; // @[WorkerCSRWrapper.scala 68:42:@1146.4]
  wire  _T_206; // @[WorkerCSRWrapper.scala 70:20:@1148.4]
  wire  _T_207; // @[WorkerCSRWrapper.scala 70:35:@1149.4]
  wire  _T_208; // @[WorkerCSRWrapper.scala 70:60:@1150.4]
  wire  _T_209; // @[WorkerCSRWrapper.scala 70:50:@1151.4]
  wire  _T_210; // @[WorkerCSRWrapper.scala 70:75:@1152.4]
  wire  _T_211; // @[WorkerCSRWrapper.scala 70:65:@1153.4]
  wire  _T_213; // @[WorkerCSRWrapper.scala 71:20:@1155.4]
  wire  _T_214; // @[WorkerCSRWrapper.scala 71:35:@1156.4]
  wire  _T_215; // @[WorkerCSRWrapper.scala 71:60:@1157.4]
  wire  _T_216; // @[WorkerCSRWrapper.scala 71:50:@1158.4]
  wire  _T_217; // @[WorkerCSRWrapper.scala 71:75:@1159.4]
  wire  _T_218; // @[WorkerCSRWrapper.scala 71:65:@1160.4]
  AddressGenerator addressGeneratorRead ( // @[WorkerCSRWrapper.scala 41:36:@1082.4]
    .clock(addressGeneratorRead_clock),
    .reset(addressGeneratorRead_reset),
    .io_ctl_start(addressGeneratorRead_io_ctl_start),
    .io_ctl_busy(addressGeneratorRead_io_ctl_busy),
    .io_ctl_startAddress(addressGeneratorRead_io_ctl_startAddress),
    .io_ctl_lineLength(addressGeneratorRead_io_ctl_lineLength),
    .io_ctl_lineCount(addressGeneratorRead_io_ctl_lineCount),
    .io_ctl_lineGap(addressGeneratorRead_io_ctl_lineGap),
    .io_xfer_done(addressGeneratorRead_io_xfer_done),
    .io_xfer_address(addressGeneratorRead_io_xfer_address),
    .io_xfer_length(addressGeneratorRead_io_xfer_length),
    .io_xfer_valid(addressGeneratorRead_io_xfer_valid)
  );
  TransferSplitter transferSplitterRead ( // @[WorkerCSRWrapper.scala 42:36:@1085.4]
    .clock(transferSplitterRead_clock),
    .reset(transferSplitterRead_reset),
    .io_xferIn_done(transferSplitterRead_io_xferIn_done),
    .io_xferIn_address(transferSplitterRead_io_xferIn_address),
    .io_xferIn_length(transferSplitterRead_io_xferIn_length),
    .io_xferIn_valid(transferSplitterRead_io_xferIn_valid),
    .io_xferOut_done(transferSplitterRead_io_xferOut_done),
    .io_xferOut_address(transferSplitterRead_io_xferOut_address),
    .io_xferOut_length(transferSplitterRead_io_xferOut_length),
    .io_xferOut_valid(transferSplitterRead_io_xferOut_valid)
  );
  AddressGenerator addressGeneratorWrite ( // @[WorkerCSRWrapper.scala 44:37:@1088.4]
    .clock(addressGeneratorWrite_clock),
    .reset(addressGeneratorWrite_reset),
    .io_ctl_start(addressGeneratorWrite_io_ctl_start),
    .io_ctl_busy(addressGeneratorWrite_io_ctl_busy),
    .io_ctl_startAddress(addressGeneratorWrite_io_ctl_startAddress),
    .io_ctl_lineLength(addressGeneratorWrite_io_ctl_lineLength),
    .io_ctl_lineCount(addressGeneratorWrite_io_ctl_lineCount),
    .io_ctl_lineGap(addressGeneratorWrite_io_ctl_lineGap),
    .io_xfer_done(addressGeneratorWrite_io_xfer_done),
    .io_xfer_address(addressGeneratorWrite_io_xfer_address),
    .io_xfer_length(addressGeneratorWrite_io_xfer_length),
    .io_xfer_valid(addressGeneratorWrite_io_xfer_valid)
  );
  TransferSplitter_1 transferSplitterWrite ( // @[WorkerCSRWrapper.scala 45:37:@1091.4]
    .io_xferIn_done(transferSplitterWrite_io_xferIn_done),
    .io_xferIn_length(transferSplitterWrite_io_xferIn_length),
    .io_xferIn_valid(transferSplitterWrite_io_xferIn_valid),
    .io_xferOut_done(transferSplitterWrite_io_xferOut_done),
    .io_xferOut_length(transferSplitterWrite_io_xferOut_length),
    .io_xferOut_valid(transferSplitterWrite_io_xferOut_valid)
  );
  ClearCSR ClearCSR ( // @[ClearCSR.scala 50:21:@1109.4]
    .clock(ClearCSR_clock),
    .reset(ClearCSR_reset),
    .io_csr_dataOut(ClearCSR_io_csr_dataOut),
    .io_csr_dataWrite(ClearCSR_io_csr_dataWrite),
    .io_csr_dataIn(ClearCSR_io_csr_dataIn),
    .io_value(ClearCSR_io_value),
    .io_clear(ClearCSR_io_clear)
  );
  StatusCSR StatusCSR ( // @[StatusCSR.scala 42:21:@1118.4]
    .clock(StatusCSR_clock),
    .io_csr_dataIn(StatusCSR_io_csr_dataIn),
    .io_value(StatusCSR_io_value)
  );
  InterruptController InterruptController ( // @[InterruptController.scala 63:22:@1126.4]
    .clock(InterruptController_clock),
    .reset(InterruptController_reset),
    .io_irq_readerDone(InterruptController_io_irq_readerDone),
    .io_irq_writerDone(InterruptController_io_irq_writerDone),
    .io_readBusy(InterruptController_io_readBusy),
    .io_writeBusy(InterruptController_io_writeBusy),
    .io_imr_dataOut(InterruptController_io_imr_dataOut),
    .io_imr_dataWrite(InterruptController_io_imr_dataWrite),
    .io_imr_dataIn(InterruptController_io_imr_dataIn),
    .io_isr_dataOut(InterruptController_io_isr_dataOut),
    .io_isr_dataWrite(InterruptController_io_isr_dataWrite),
    .io_isr_dataIn(InterruptController_io_isr_dataIn)
  );
  SimpleCSR SimpleCSR ( // @[SimpleCSR.scala 48:21:@1163.4]
    .clock(SimpleCSR_clock),
    .reset(SimpleCSR_reset),
    .io_csr_dataOut(SimpleCSR_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_io_csr_dataIn),
    .io_value(SimpleCSR_io_value)
  );
  SimpleCSR SimpleCSR_1 ( // @[SimpleCSR.scala 48:21:@1171.4]
    .clock(SimpleCSR_1_clock),
    .reset(SimpleCSR_1_reset),
    .io_csr_dataOut(SimpleCSR_1_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_1_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_1_io_csr_dataIn),
    .io_value(SimpleCSR_1_io_value)
  );
  SimpleCSR SimpleCSR_2 ( // @[SimpleCSR.scala 48:21:@1179.4]
    .clock(SimpleCSR_2_clock),
    .reset(SimpleCSR_2_reset),
    .io_csr_dataOut(SimpleCSR_2_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_2_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_2_io_csr_dataIn),
    .io_value(SimpleCSR_2_io_value)
  );
  SimpleCSR SimpleCSR_3 ( // @[SimpleCSR.scala 48:21:@1187.4]
    .clock(SimpleCSR_3_clock),
    .reset(SimpleCSR_3_reset),
    .io_csr_dataOut(SimpleCSR_3_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_3_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_3_io_csr_dataIn),
    .io_value(SimpleCSR_3_io_value)
  );
  SimpleCSR SimpleCSR_4 ( // @[SimpleCSR.scala 48:21:@1196.4]
    .clock(SimpleCSR_4_clock),
    .reset(SimpleCSR_4_reset),
    .io_csr_dataOut(SimpleCSR_4_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_4_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_4_io_csr_dataIn),
    .io_value(SimpleCSR_4_io_value)
  );
  SimpleCSR SimpleCSR_5 ( // @[SimpleCSR.scala 48:21:@1204.4]
    .clock(SimpleCSR_5_clock),
    .reset(SimpleCSR_5_reset),
    .io_csr_dataOut(SimpleCSR_5_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_5_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_5_io_csr_dataIn),
    .io_value(SimpleCSR_5_io_value)
  );
  SimpleCSR SimpleCSR_6 ( // @[SimpleCSR.scala 48:21:@1212.4]
    .clock(SimpleCSR_6_clock),
    .reset(SimpleCSR_6_reset),
    .io_csr_dataOut(SimpleCSR_6_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_6_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_6_io_csr_dataIn),
    .io_value(SimpleCSR_6_io_value)
  );
  SimpleCSR SimpleCSR_7 ( // @[SimpleCSR.scala 48:21:@1220.4]
    .clock(SimpleCSR_7_clock),
    .reset(SimpleCSR_7_reset),
    .io_csr_dataOut(SimpleCSR_7_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_7_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_7_io_csr_dataIn),
    .io_value(SimpleCSR_7_io_value)
  );
  SimpleCSR SimpleCSR_8 ( // @[SimpleCSR.scala 48:21:@1228.4]
    .clock(SimpleCSR_8_clock),
    .reset(SimpleCSR_8_reset),
    .io_csr_dataOut(SimpleCSR_8_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_8_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_8_io_csr_dataIn),
    .io_value(SimpleCSR_8_io_value)
  );
  SimpleCSR SimpleCSR_9 ( // @[SimpleCSR.scala 48:21:@1235.4]
    .clock(SimpleCSR_9_clock),
    .reset(SimpleCSR_9_reset),
    .io_csr_dataOut(SimpleCSR_9_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_9_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_9_io_csr_dataIn),
    .io_value(SimpleCSR_9_io_value)
  );
  SimpleCSR SimpleCSR_10 ( // @[SimpleCSR.scala 48:21:@1242.4]
    .clock(SimpleCSR_10_clock),
    .reset(SimpleCSR_10_reset),
    .io_csr_dataOut(SimpleCSR_10_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_10_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_10_io_csr_dataIn),
    .io_value(SimpleCSR_10_io_value)
  );
  SimpleCSR SimpleCSR_11 ( // @[SimpleCSR.scala 48:21:@1249.4]
    .clock(SimpleCSR_11_clock),
    .reset(SimpleCSR_11_reset),
    .io_csr_dataOut(SimpleCSR_11_io_csr_dataOut),
    .io_csr_dataWrite(SimpleCSR_11_io_csr_dataWrite),
    .io_csr_dataIn(SimpleCSR_11_io_csr_dataIn),
    .io_value(SimpleCSR_11_io_value)
  );
  assign _T_199 = {readerStart,writerStart}; // @[Cat.scala 30:58:@1141.4]
  assign control = ClearCSR_io_value; // @[WorkerCSRWrapper.scala 58:21:@1107.4 WorkerCSRWrapper.scala 61:11:@1117.4]
  assign _T_200 = control[5]; // @[WorkerCSRWrapper.scala 68:56:@1142.4]
  assign _T_201 = control[4]; // @[WorkerCSRWrapper.scala 68:68:@1143.4]
  assign _T_202 = {_T_200,_T_201}; // @[Cat.scala 30:58:@1144.4]
  assign _T_203 = ~ _T_202; // @[WorkerCSRWrapper.scala 68:44:@1145.4]
  assign clear = _T_199 & _T_203; // @[WorkerCSRWrapper.scala 68:42:@1146.4]
  assign _T_206 = readerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 70:20:@1148.4]
  assign _T_207 = _T_206 & readerSync; // @[WorkerCSRWrapper.scala 70:35:@1149.4]
  assign _T_208 = control[3]; // @[WorkerCSRWrapper.scala 70:60:@1150.4]
  assign _T_209 = _T_207 | _T_208; // @[WorkerCSRWrapper.scala 70:50:@1151.4]
  assign _T_210 = control[1]; // @[WorkerCSRWrapper.scala 70:75:@1152.4]
  assign _T_211 = _T_209 & _T_210; // @[WorkerCSRWrapper.scala 70:65:@1153.4]
  assign _T_213 = writerSyncOld == 1'h0; // @[WorkerCSRWrapper.scala 71:20:@1155.4]
  assign _T_214 = _T_213 & writerSync; // @[WorkerCSRWrapper.scala 71:35:@1156.4]
  assign _T_215 = control[2]; // @[WorkerCSRWrapper.scala 71:60:@1157.4]
  assign _T_216 = _T_214 | _T_215; // @[WorkerCSRWrapper.scala 71:50:@1158.4]
  assign _T_217 = control[0]; // @[WorkerCSRWrapper.scala 71:75:@1159.4]
  assign _T_218 = _T_216 & _T_217; // @[WorkerCSRWrapper.scala 71:65:@1160.4]
  assign io_csr_0_dataIn = ClearCSR_io_csr_dataIn; // @[ClearCSR.scala 54:16:@1113.4]
  assign io_csr_1_dataIn = StatusCSR_io_csr_dataIn; // @[StatusCSR.scala 44:16:@1121.4]
  assign io_csr_2_dataIn = InterruptController_io_imr_dataIn; // @[InterruptController.scala 68:17:@1131.4]
  assign io_csr_3_dataIn = InterruptController_io_isr_dataIn; // @[InterruptController.scala 69:17:@1135.4]
  assign io_csr_4_dataIn = SimpleCSR_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1166.4]
  assign io_csr_5_dataIn = SimpleCSR_1_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1174.4]
  assign io_csr_6_dataIn = SimpleCSR_2_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1182.4]
  assign io_csr_7_dataIn = SimpleCSR_3_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1190.4]
  assign io_csr_8_dataIn = SimpleCSR_4_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1199.4]
  assign io_csr_9_dataIn = SimpleCSR_5_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1207.4]
  assign io_csr_10_dataIn = SimpleCSR_6_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1215.4]
  assign io_csr_11_dataIn = SimpleCSR_7_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1223.4]
  assign io_csr_12_dataIn = SimpleCSR_8_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1231.4]
  assign io_csr_13_dataIn = SimpleCSR_9_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1238.4]
  assign io_csr_14_dataIn = SimpleCSR_10_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1245.4]
  assign io_csr_15_dataIn = SimpleCSR_11_io_csr_dataIn; // @[SimpleCSR.scala 50:16:@1252.4]
  assign io_irq_readerDone = InterruptController_io_irq_readerDone; // @[WorkerCSRWrapper.scala 65:10:@1140.4]
  assign io_irq_writerDone = InterruptController_io_irq_writerDone; // @[WorkerCSRWrapper.scala 65:10:@1139.4]
  assign io_xferRead_address = transferSplitterRead_io_xferOut_address; // @[WorkerCSRWrapper.scala 90:15:@1262.4]
  assign io_xferRead_length = transferSplitterRead_io_xferOut_length; // @[WorkerCSRWrapper.scala 90:15:@1261.4]
  assign io_xferRead_valid = transferSplitterRead_io_xferOut_valid; // @[WorkerCSRWrapper.scala 90:15:@1260.4]
  assign io_xferWrite_length = transferSplitterWrite_io_xferOut_length; // @[WorkerCSRWrapper.scala 93:16:@1269.4]
  assign io_xferWrite_valid = transferSplitterWrite_io_xferOut_valid; // @[WorkerCSRWrapper.scala 93:16:@1268.4]
  assign addressGeneratorRead_clock = clock; // @[:@1083.4]
  assign addressGeneratorRead_reset = reset; // @[:@1084.4]
  assign addressGeneratorRead_io_ctl_start = readerStart; // @[WorkerCSRWrapper.scala 73:37:@1162.4]
  assign addressGeneratorRead_io_ctl_startAddress = SimpleCSR_io_value; // @[WorkerCSRWrapper.scala 74:44:@1170.4]
  assign addressGeneratorRead_io_ctl_lineLength = SimpleCSR_1_io_value; // @[WorkerCSRWrapper.scala 75:42:@1178.4]
  assign addressGeneratorRead_io_ctl_lineCount = SimpleCSR_2_io_value; // @[WorkerCSRWrapper.scala 76:41:@1186.4]
  assign addressGeneratorRead_io_ctl_lineGap = SimpleCSR_3_io_value; // @[WorkerCSRWrapper.scala 77:39:@1194.4]
  assign addressGeneratorRead_io_xfer_done = transferSplitterRead_io_xferIn_done; // @[WorkerCSRWrapper.scala 89:34:@1259.4]
  assign transferSplitterRead_clock = clock; // @[:@1086.4]
  assign transferSplitterRead_reset = reset; // @[:@1087.4]
  assign transferSplitterRead_io_xferIn_address = addressGeneratorRead_io_xfer_address; // @[WorkerCSRWrapper.scala 89:34:@1258.4]
  assign transferSplitterRead_io_xferIn_length = addressGeneratorRead_io_xfer_length; // @[WorkerCSRWrapper.scala 89:34:@1257.4]
  assign transferSplitterRead_io_xferIn_valid = addressGeneratorRead_io_xfer_valid; // @[WorkerCSRWrapper.scala 89:34:@1256.4]
  assign transferSplitterRead_io_xferOut_done = io_xferRead_done; // @[WorkerCSRWrapper.scala 90:15:@1263.4]
  assign addressGeneratorWrite_clock = clock; // @[:@1089.4]
  assign addressGeneratorWrite_reset = reset; // @[:@1090.4]
  assign addressGeneratorWrite_io_ctl_start = writerStart; // @[WorkerCSRWrapper.scala 79:38:@1195.4]
  assign addressGeneratorWrite_io_ctl_startAddress = SimpleCSR_4_io_value; // @[WorkerCSRWrapper.scala 80:45:@1203.4]
  assign addressGeneratorWrite_io_ctl_lineLength = SimpleCSR_5_io_value; // @[WorkerCSRWrapper.scala 81:43:@1211.4]
  assign addressGeneratorWrite_io_ctl_lineCount = SimpleCSR_6_io_value; // @[WorkerCSRWrapper.scala 82:42:@1219.4]
  assign addressGeneratorWrite_io_ctl_lineGap = SimpleCSR_7_io_value; // @[WorkerCSRWrapper.scala 83:40:@1227.4]
  assign addressGeneratorWrite_io_xfer_done = transferSplitterWrite_io_xferIn_done; // @[WorkerCSRWrapper.scala 92:35:@1267.4]
  assign transferSplitterWrite_io_xferIn_length = addressGeneratorWrite_io_xfer_length; // @[WorkerCSRWrapper.scala 92:35:@1265.4]
  assign transferSplitterWrite_io_xferIn_valid = addressGeneratorWrite_io_xfer_valid; // @[WorkerCSRWrapper.scala 92:35:@1264.4]
  assign transferSplitterWrite_io_xferOut_done = io_xferWrite_done; // @[WorkerCSRWrapper.scala 93:16:@1271.4]
  assign ClearCSR_clock = clock; // @[:@1110.4]
  assign ClearCSR_reset = reset; // @[:@1111.4]
  assign ClearCSR_io_csr_dataOut = io_csr_0_dataOut; // @[ClearCSR.scala 54:16:@1115.4]
  assign ClearCSR_io_csr_dataWrite = io_csr_0_dataWrite; // @[ClearCSR.scala 54:16:@1114.4]
  assign ClearCSR_io_clear = {{30'd0}, clear}; // @[ClearCSR.scala 52:18:@1112.4]
  assign StatusCSR_clock = clock; // @[:@1119.4]
  assign StatusCSR_io_value = {{30'd0}, status}; // @[StatusCSR.scala 46:18:@1125.4]
  assign InterruptController_clock = clock; // @[:@1127.4]
  assign InterruptController_reset = reset; // @[:@1128.4]
  assign InterruptController_io_readBusy = addressGeneratorRead_io_ctl_busy; // @[InterruptController.scala 65:22:@1129.4]
  assign InterruptController_io_writeBusy = addressGeneratorWrite_io_ctl_busy; // @[InterruptController.scala 66:23:@1130.4]
  assign InterruptController_io_imr_dataOut = io_csr_2_dataOut; // @[InterruptController.scala 68:17:@1133.4]
  assign InterruptController_io_imr_dataWrite = io_csr_2_dataWrite; // @[InterruptController.scala 68:17:@1132.4]
  assign InterruptController_io_isr_dataOut = io_csr_3_dataOut; // @[InterruptController.scala 69:17:@1137.4]
  assign InterruptController_io_isr_dataWrite = io_csr_3_dataWrite; // @[InterruptController.scala 69:17:@1136.4]
  assign SimpleCSR_clock = clock; // @[:@1164.4]
  assign SimpleCSR_reset = reset; // @[:@1165.4]
  assign SimpleCSR_io_csr_dataOut = io_csr_4_dataOut; // @[SimpleCSR.scala 50:16:@1168.4]
  assign SimpleCSR_io_csr_dataWrite = io_csr_4_dataWrite; // @[SimpleCSR.scala 50:16:@1167.4]
  assign SimpleCSR_1_clock = clock; // @[:@1172.4]
  assign SimpleCSR_1_reset = reset; // @[:@1173.4]
  assign SimpleCSR_1_io_csr_dataOut = io_csr_5_dataOut; // @[SimpleCSR.scala 50:16:@1176.4]
  assign SimpleCSR_1_io_csr_dataWrite = io_csr_5_dataWrite; // @[SimpleCSR.scala 50:16:@1175.4]
  assign SimpleCSR_2_clock = clock; // @[:@1180.4]
  assign SimpleCSR_2_reset = reset; // @[:@1181.4]
  assign SimpleCSR_2_io_csr_dataOut = io_csr_6_dataOut; // @[SimpleCSR.scala 50:16:@1184.4]
  assign SimpleCSR_2_io_csr_dataWrite = io_csr_6_dataWrite; // @[SimpleCSR.scala 50:16:@1183.4]
  assign SimpleCSR_3_clock = clock; // @[:@1188.4]
  assign SimpleCSR_3_reset = reset; // @[:@1189.4]
  assign SimpleCSR_3_io_csr_dataOut = io_csr_7_dataOut; // @[SimpleCSR.scala 50:16:@1192.4]
  assign SimpleCSR_3_io_csr_dataWrite = io_csr_7_dataWrite; // @[SimpleCSR.scala 50:16:@1191.4]
  assign SimpleCSR_4_clock = clock; // @[:@1197.4]
  assign SimpleCSR_4_reset = reset; // @[:@1198.4]
  assign SimpleCSR_4_io_csr_dataOut = io_csr_8_dataOut; // @[SimpleCSR.scala 50:16:@1201.4]
  assign SimpleCSR_4_io_csr_dataWrite = io_csr_8_dataWrite; // @[SimpleCSR.scala 50:16:@1200.4]
  assign SimpleCSR_5_clock = clock; // @[:@1205.4]
  assign SimpleCSR_5_reset = reset; // @[:@1206.4]
  assign SimpleCSR_5_io_csr_dataOut = io_csr_9_dataOut; // @[SimpleCSR.scala 50:16:@1209.4]
  assign SimpleCSR_5_io_csr_dataWrite = io_csr_9_dataWrite; // @[SimpleCSR.scala 50:16:@1208.4]
  assign SimpleCSR_6_clock = clock; // @[:@1213.4]
  assign SimpleCSR_6_reset = reset; // @[:@1214.4]
  assign SimpleCSR_6_io_csr_dataOut = io_csr_10_dataOut; // @[SimpleCSR.scala 50:16:@1217.4]
  assign SimpleCSR_6_io_csr_dataWrite = io_csr_10_dataWrite; // @[SimpleCSR.scala 50:16:@1216.4]
  assign SimpleCSR_7_clock = clock; // @[:@1221.4]
  assign SimpleCSR_7_reset = reset; // @[:@1222.4]
  assign SimpleCSR_7_io_csr_dataOut = io_csr_11_dataOut; // @[SimpleCSR.scala 50:16:@1225.4]
  assign SimpleCSR_7_io_csr_dataWrite = io_csr_11_dataWrite; // @[SimpleCSR.scala 50:16:@1224.4]
  assign SimpleCSR_8_clock = clock; // @[:@1229.4]
  assign SimpleCSR_8_reset = reset; // @[:@1230.4]
  assign SimpleCSR_8_io_csr_dataOut = io_csr_12_dataOut; // @[SimpleCSR.scala 50:16:@1233.4]
  assign SimpleCSR_8_io_csr_dataWrite = io_csr_12_dataWrite; // @[SimpleCSR.scala 50:16:@1232.4]
  assign SimpleCSR_9_clock = clock; // @[:@1236.4]
  assign SimpleCSR_9_reset = reset; // @[:@1237.4]
  assign SimpleCSR_9_io_csr_dataOut = io_csr_13_dataOut; // @[SimpleCSR.scala 50:16:@1240.4]
  assign SimpleCSR_9_io_csr_dataWrite = io_csr_13_dataWrite; // @[SimpleCSR.scala 50:16:@1239.4]
  assign SimpleCSR_10_clock = clock; // @[:@1243.4]
  assign SimpleCSR_10_reset = reset; // @[:@1244.4]
  assign SimpleCSR_10_io_csr_dataOut = io_csr_14_dataOut; // @[SimpleCSR.scala 50:16:@1247.4]
  assign SimpleCSR_10_io_csr_dataWrite = io_csr_14_dataWrite; // @[SimpleCSR.scala 50:16:@1246.4]
  assign SimpleCSR_11_clock = clock; // @[:@1250.4]
  assign SimpleCSR_11_reset = reset; // @[:@1251.4]
  assign SimpleCSR_11_io_csr_dataOut = io_csr_15_dataOut; // @[SimpleCSR.scala 50:16:@1254.4]
  assign SimpleCSR_11_io_csr_dataWrite = io_csr_15_dataWrite; // @[SimpleCSR.scala 50:16:@1253.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  readerSync = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  readerSyncOld = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  writerSync = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  writerSyncOld = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  readerStart = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  writerStart = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    status <= {addressGeneratorRead_io_ctl_busy,addressGeneratorWrite_io_ctl_busy};
    readerSync <= io_sync_readerSync;
    readerSyncOld <= readerSync;
    writerSync <= io_sync_writerSync;
    writerSyncOld <= writerSync;
    if (reset) begin
      readerStart <= 1'h0;
    end else begin
      readerStart <= _T_211;
    end
    if (reset) begin
      writerStart <= 1'h0;
    end else begin
      writerStart <= _T_218;
    end
  end
endmodule
module Queue( // @[:@1273.2]
  input         clock, // @[:@1274.4]
  input         reset, // @[:@1275.4]
  output        io_enq_ready, // @[:@1276.4]
  input         io_enq_valid, // @[:@1276.4]
  input  [63:0] io_enq_bits, // @[:@1276.4]
  input         io_deq_ready, // @[:@1276.4]
  output        io_deq_valid, // @[:@1276.4]
  output [63:0] io_deq_bits // @[:@1276.4]
);
  reg [63:0] ram [0:511]; // @[Decoupled.scala 215:24:@1278.4]
  reg [63:0] _RAND_0;
  wire [63:0] ram__T_63_data; // @[Decoupled.scala 215:24:@1278.4]
  wire [8:0] ram__T_63_addr; // @[Decoupled.scala 215:24:@1278.4]
  wire [63:0] ram__T_49_data; // @[Decoupled.scala 215:24:@1278.4]
  wire [8:0] ram__T_49_addr; // @[Decoupled.scala 215:24:@1278.4]
  wire  ram__T_49_mask; // @[Decoupled.scala 215:24:@1278.4]
  wire  ram__T_49_en; // @[Decoupled.scala 215:24:@1278.4]
  reg [8:0] value; // @[Counter.scala 26:33:@1279.4]
  reg [31:0] _RAND_1;
  reg [8:0] value_1; // @[Counter.scala 26:33:@1280.4]
  reg [31:0] _RAND_2;
  reg  maybe_full; // @[Decoupled.scala 218:35:@1281.4]
  reg [31:0] _RAND_3;
  wire  _T_41; // @[Decoupled.scala 220:41:@1282.4]
  wire  _T_43; // @[Decoupled.scala 221:36:@1283.4]
  wire  empty; // @[Decoupled.scala 221:33:@1284.4]
  wire  _T_44; // @[Decoupled.scala 222:32:@1285.4]
  wire  do_enq; // @[Decoupled.scala 37:37:@1286.4]
  wire  do_deq; // @[Decoupled.scala 37:37:@1289.4]
  wire [9:0] _T_52; // @[Counter.scala 35:22:@1296.6]
  wire [8:0] _T_53; // @[Counter.scala 35:22:@1297.6]
  wire [8:0] _GEN_5; // @[Decoupled.scala 226:17:@1292.4]
  wire [9:0] _T_56; // @[Counter.scala 35:22:@1302.6]
  wire [8:0] _T_57; // @[Counter.scala 35:22:@1303.6]
  wire [8:0] _GEN_6; // @[Decoupled.scala 230:17:@1300.4]
  wire  _T_58; // @[Decoupled.scala 233:16:@1306.4]
  wire  _GEN_7; // @[Decoupled.scala 233:28:@1307.4]
  assign ram__T_63_addr = value_1;
  assign ram__T_63_data = ram[ram__T_63_addr]; // @[Decoupled.scala 215:24:@1278.4]
  assign ram__T_49_data = io_enq_bits;
  assign ram__T_49_addr = value;
  assign ram__T_49_mask = 1'h1;
  assign ram__T_49_en = io_enq_ready & io_enq_valid;
  assign _T_41 = value == value_1; // @[Decoupled.scala 220:41:@1282.4]
  assign _T_43 = maybe_full == 1'h0; // @[Decoupled.scala 221:36:@1283.4]
  assign empty = _T_41 & _T_43; // @[Decoupled.scala 221:33:@1284.4]
  assign _T_44 = _T_41 & maybe_full; // @[Decoupled.scala 222:32:@1285.4]
  assign do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:@1286.4]
  assign do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:@1289.4]
  assign _T_52 = value + 9'h1; // @[Counter.scala 35:22:@1296.6]
  assign _T_53 = value + 9'h1; // @[Counter.scala 35:22:@1297.6]
  assign _GEN_5 = do_enq ? _T_53 : value; // @[Decoupled.scala 226:17:@1292.4]
  assign _T_56 = value_1 + 9'h1; // @[Counter.scala 35:22:@1302.6]
  assign _T_57 = value_1 + 9'h1; // @[Counter.scala 35:22:@1303.6]
  assign _GEN_6 = do_deq ? _T_57 : value_1; // @[Decoupled.scala 230:17:@1300.4]
  assign _T_58 = do_enq != do_deq; // @[Decoupled.scala 233:16:@1306.4]
  assign _GEN_7 = _T_58 ? do_enq : maybe_full; // @[Decoupled.scala 233:28:@1307.4]
  assign io_enq_ready = _T_44 == 1'h0; // @[Decoupled.scala 238:16:@1313.4]
  assign io_deq_valid = empty == 1'h0; // @[Decoupled.scala 237:16:@1311.4]
  assign io_deq_bits = ram__T_63_data; // @[Decoupled.scala 239:15:@1315.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(ram__T_49_en & ram__T_49_mask) begin
      ram[ram__T_49_addr] <= ram__T_49_data; // @[Decoupled.scala 215:24:@1278.4]
    end
    if (reset) begin
      value <= 9'h0;
    end else begin
      if (do_enq) begin
        value <= _T_53;
      end
    end
    if (reset) begin
      value_1 <= 9'h0;
    end else begin
      if (do_deq) begin
        value_1 <= _T_57;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (_T_58) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module DMATop( // @[:@1324.2]
  input         clock, // @[:@1325.4]
  input         reset, // @[:@1326.4]
  input  [31:0] io_control_aw_awaddr, // @[:@1327.4]
  input  [2:0]  io_control_aw_awprot, // @[:@1327.4]
  input         io_control_aw_awvalid, // @[:@1327.4]
  output        io_control_aw_awready, // @[:@1327.4]
  input  [31:0] io_control_w_wdata, // @[:@1327.4]
  input  [3:0]  io_control_w_wstrb, // @[:@1327.4]
  input         io_control_w_wvalid, // @[:@1327.4]
  output        io_control_w_wready, // @[:@1327.4]
  output [1:0]  io_control_b_bresp, // @[:@1327.4]
  output        io_control_b_bvalid, // @[:@1327.4]
  input         io_control_b_bready, // @[:@1327.4]
  input  [31:0] io_control_ar_araddr, // @[:@1327.4]
  input  [2:0]  io_control_ar_arprot, // @[:@1327.4]
  input         io_control_ar_arvalid, // @[:@1327.4]
  output        io_control_ar_arready, // @[:@1327.4]
  output [31:0] io_control_r_rdata, // @[:@1327.4]
  output [1:0]  io_control_r_rresp, // @[:@1327.4]
  output        io_control_r_rvalid, // @[:@1327.4]
  input         io_control_r_rready, // @[:@1327.4]
  output [3:0]  io_read_aw_awid, // @[:@1327.4]
  output [31:0] io_read_aw_awaddr, // @[:@1327.4]
  output [7:0]  io_read_aw_awlen, // @[:@1327.4]
  output [2:0]  io_read_aw_awsize, // @[:@1327.4]
  output [1:0]  io_read_aw_awburst, // @[:@1327.4]
  output        io_read_aw_awlock, // @[:@1327.4]
  output [3:0]  io_read_aw_awcache, // @[:@1327.4]
  output [2:0]  io_read_aw_awprot, // @[:@1327.4]
  output [3:0]  io_read_aw_awqos, // @[:@1327.4]
  output        io_read_aw_awvalid, // @[:@1327.4]
  input         io_read_aw_awready, // @[:@1327.4]
  output [63:0] io_read_w_wdata, // @[:@1327.4]
  output [7:0]  io_read_w_wstrb, // @[:@1327.4]
  output        io_read_w_wlast, // @[:@1327.4]
  output        io_read_w_wvalid, // @[:@1327.4]
  input         io_read_w_wready, // @[:@1327.4]
  input  [3:0]  io_read_b_bid, // @[:@1327.4]
  input  [1:0]  io_read_b_bresp, // @[:@1327.4]
  input         io_read_b_bvalid, // @[:@1327.4]
  output        io_read_b_bready, // @[:@1327.4]
  output [3:0]  io_read_ar_arid, // @[:@1327.4]
  output [31:0] io_read_ar_araddr, // @[:@1327.4]
  output [7:0]  io_read_ar_arlen, // @[:@1327.4]
  output [2:0]  io_read_ar_arsize, // @[:@1327.4]
  output [1:0]  io_read_ar_arburst, // @[:@1327.4]
  output        io_read_ar_arlock, // @[:@1327.4]
  output [3:0]  io_read_ar_arcache, // @[:@1327.4]
  output [2:0]  io_read_ar_arprot, // @[:@1327.4]
  output [3:0]  io_read_ar_arqos, // @[:@1327.4]
  output        io_read_ar_arvalid, // @[:@1327.4]
  input         io_read_ar_arready, // @[:@1327.4]
  input  [3:0]  io_read_r_rid, // @[:@1327.4]
  input  [63:0] io_read_r_rdata, // @[:@1327.4]
  input  [1:0]  io_read_r_rresp, // @[:@1327.4]
  input         io_read_r_rlast, // @[:@1327.4]
  input         io_read_r_rvalid, // @[:@1327.4]
  output        io_read_r_rready, // @[:@1327.4]
  output [63:0] io_write_tdata, // @[:@1327.4]
  output        io_write_tvalid, // @[:@1327.4]
  input         io_write_tready, // @[:@1327.4]
  output        io_write_tuser, // @[:@1327.4]
  output        io_write_tlast, // @[:@1327.4]
  output        io_irq_readerDone, // @[:@1327.4]
  output        io_irq_writerDone, // @[:@1327.4]
  input         io_sync_readerSync, // @[:@1327.4]
  input         io_sync_writerSync // @[:@1327.4]
);
  wire  csrFrontend_clock; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_reset; // @[DMATop.scala 42:27:@1329.4]
  wire [31:0] csrFrontend_io_ctl_aw_awaddr; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_aw_awvalid; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_aw_awready; // @[DMATop.scala 42:27:@1329.4]
  wire [31:0] csrFrontend_io_ctl_w_wdata; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_w_wvalid; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_w_wready; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_b_bvalid; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_b_bready; // @[DMATop.scala 42:27:@1329.4]
  wire [31:0] csrFrontend_io_ctl_ar_araddr; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_ar_arvalid; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_ar_arready; // @[DMATop.scala 42:27:@1329.4]
  wire [31:0] csrFrontend_io_ctl_r_rdata; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_r_rvalid; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_ctl_r_rready; // @[DMATop.scala 42:27:@1329.4]
  wire [3:0] csrFrontend_io_bus_addr; // @[DMATop.scala 42:27:@1329.4]
  wire [31:0] csrFrontend_io_bus_dataOut; // @[DMATop.scala 42:27:@1329.4]
  wire [31:0] csrFrontend_io_bus_dataIn; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_bus_write; // @[DMATop.scala 42:27:@1329.4]
  wire  csrFrontend_io_bus_read; // @[DMATop.scala 42:27:@1329.4]
  wire  readerFrontend_clock; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_reset; // @[DMATop.scala 44:30:@1332.4]
  wire [31:0] readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 44:30:@1332.4]
  wire [7:0] readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_bus_ar_arready; // @[DMATop.scala 44:30:@1332.4]
  wire [63:0] readerFrontend_io_bus_r_rdata; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_bus_r_rlast; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_bus_r_rvalid; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_bus_r_rready; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_dataOut_ready; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_dataOut_valid; // @[DMATop.scala 44:30:@1332.4]
  wire [63:0] readerFrontend_io_dataOut_bits; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_xfer_done; // @[DMATop.scala 44:30:@1332.4]
  wire [31:0] readerFrontend_io_xfer_address; // @[DMATop.scala 44:30:@1332.4]
  wire [31:0] readerFrontend_io_xfer_length; // @[DMATop.scala 44:30:@1332.4]
  wire  readerFrontend_io_xfer_valid; // @[DMATop.scala 44:30:@1332.4]
  wire  writerFrontend_clock; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_reset; // @[DMATop.scala 46:30:@1335.4]
  wire [63:0] writerFrontend_io_bus_tdata; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_bus_tvalid; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_bus_tready; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_bus_tlast; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_dataIn_ready; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_dataIn_valid; // @[DMATop.scala 46:30:@1335.4]
  wire [63:0] writerFrontend_io_dataIn_bits; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_xfer_done; // @[DMATop.scala 46:30:@1335.4]
  wire [31:0] writerFrontend_io_xfer_length; // @[DMATop.scala 46:30:@1335.4]
  wire  writerFrontend_io_xfer_valid; // @[DMATop.scala 46:30:@1335.4]
  wire [31:0] csr_io_csr_0_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_0_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_0_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_1_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_2_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_2_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_2_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_3_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_3_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_3_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_4_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_4_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_4_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_5_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_5_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_5_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_6_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_6_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_6_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_7_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_7_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_7_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_8_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_8_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_8_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_9_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_9_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_9_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_10_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_10_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_10_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_11_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_11_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_11_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_12_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_12_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_12_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_13_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_13_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_13_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_14_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_14_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_14_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_15_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_csr_15_dataWrite; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_csr_15_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire [3:0] csr_io_bus_addr; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_bus_dataOut; // @[DMATop.scala 48:19:@1338.4]
  wire [31:0] csr_io_bus_dataIn; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_bus_write; // @[DMATop.scala 48:19:@1338.4]
  wire  csr_io_bus_read; // @[DMATop.scala 48:19:@1338.4]
  wire  ctl_clock; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_reset; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_0_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_0_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_0_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_1_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_2_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_2_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_2_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_3_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_3_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_3_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_4_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_4_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_4_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_5_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_5_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_5_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_6_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_6_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_6_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_7_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_7_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_7_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_8_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_8_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_8_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_9_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_9_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_9_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_10_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_10_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_10_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_11_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_11_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_11_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_12_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_12_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_12_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_13_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_13_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_13_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_14_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_14_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_14_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_15_dataOut; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_csr_15_dataWrite; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_csr_15_dataIn; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_irq_readerDone; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_irq_writerDone; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_sync_readerSync; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_sync_writerSync; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_xferRead_done; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_xferRead_address; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_xferRead_length; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_xferRead_valid; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_xferWrite_done; // @[DMATop.scala 50:19:@1341.4]
  wire [31:0] ctl_io_xferWrite_length; // @[DMATop.scala 50:19:@1341.4]
  wire  ctl_io_xferWrite_valid; // @[DMATop.scala 50:19:@1341.4]
  wire  queue_clock; // @[Decoupled.scala 294:21:@1344.4]
  wire  queue_reset; // @[Decoupled.scala 294:21:@1344.4]
  wire  queue_io_enq_ready; // @[Decoupled.scala 294:21:@1344.4]
  wire  queue_io_enq_valid; // @[Decoupled.scala 294:21:@1344.4]
  wire [63:0] queue_io_enq_bits; // @[Decoupled.scala 294:21:@1344.4]
  wire  queue_io_deq_ready; // @[Decoupled.scala 294:21:@1344.4]
  wire  queue_io_deq_valid; // @[Decoupled.scala 294:21:@1344.4]
  wire [63:0] queue_io_deq_bits; // @[Decoupled.scala 294:21:@1344.4]
  AXI4LiteCSR csrFrontend ( // @[DMATop.scala 42:27:@1329.4]
    .clock(csrFrontend_clock),
    .reset(csrFrontend_reset),
    .io_ctl_aw_awaddr(csrFrontend_io_ctl_aw_awaddr),
    .io_ctl_aw_awvalid(csrFrontend_io_ctl_aw_awvalid),
    .io_ctl_aw_awready(csrFrontend_io_ctl_aw_awready),
    .io_ctl_w_wdata(csrFrontend_io_ctl_w_wdata),
    .io_ctl_w_wvalid(csrFrontend_io_ctl_w_wvalid),
    .io_ctl_w_wready(csrFrontend_io_ctl_w_wready),
    .io_ctl_b_bvalid(csrFrontend_io_ctl_b_bvalid),
    .io_ctl_b_bready(csrFrontend_io_ctl_b_bready),
    .io_ctl_ar_araddr(csrFrontend_io_ctl_ar_araddr),
    .io_ctl_ar_arvalid(csrFrontend_io_ctl_ar_arvalid),
    .io_ctl_ar_arready(csrFrontend_io_ctl_ar_arready),
    .io_ctl_r_rdata(csrFrontend_io_ctl_r_rdata),
    .io_ctl_r_rvalid(csrFrontend_io_ctl_r_rvalid),
    .io_ctl_r_rready(csrFrontend_io_ctl_r_rready),
    .io_bus_addr(csrFrontend_io_bus_addr),
    .io_bus_dataOut(csrFrontend_io_bus_dataOut),
    .io_bus_dataIn(csrFrontend_io_bus_dataIn),
    .io_bus_write(csrFrontend_io_bus_write),
    .io_bus_read(csrFrontend_io_bus_read)
  );
  AXI4Reader readerFrontend ( // @[DMATop.scala 44:30:@1332.4]
    .clock(readerFrontend_clock),
    .reset(readerFrontend_reset),
    .io_bus_ar_araddr(readerFrontend_io_bus_ar_araddr),
    .io_bus_ar_arlen(readerFrontend_io_bus_ar_arlen),
    .io_bus_ar_arvalid(readerFrontend_io_bus_ar_arvalid),
    .io_bus_ar_arready(readerFrontend_io_bus_ar_arready),
    .io_bus_r_rdata(readerFrontend_io_bus_r_rdata),
    .io_bus_r_rlast(readerFrontend_io_bus_r_rlast),
    .io_bus_r_rvalid(readerFrontend_io_bus_r_rvalid),
    .io_bus_r_rready(readerFrontend_io_bus_r_rready),
    .io_dataOut_ready(readerFrontend_io_dataOut_ready),
    .io_dataOut_valid(readerFrontend_io_dataOut_valid),
    .io_dataOut_bits(readerFrontend_io_dataOut_bits),
    .io_xfer_done(readerFrontend_io_xfer_done),
    .io_xfer_address(readerFrontend_io_xfer_address),
    .io_xfer_length(readerFrontend_io_xfer_length),
    .io_xfer_valid(readerFrontend_io_xfer_valid)
  );
  AXIStreamMaster writerFrontend ( // @[DMATop.scala 46:30:@1335.4]
    .clock(writerFrontend_clock),
    .reset(writerFrontend_reset),
    .io_bus_tdata(writerFrontend_io_bus_tdata),
    .io_bus_tvalid(writerFrontend_io_bus_tvalid),
    .io_bus_tready(writerFrontend_io_bus_tready),
    .io_bus_tlast(writerFrontend_io_bus_tlast),
    .io_dataIn_ready(writerFrontend_io_dataIn_ready),
    .io_dataIn_valid(writerFrontend_io_dataIn_valid),
    .io_dataIn_bits(writerFrontend_io_dataIn_bits),
    .io_xfer_done(writerFrontend_io_xfer_done),
    .io_xfer_length(writerFrontend_io_xfer_length),
    .io_xfer_valid(writerFrontend_io_xfer_valid)
  );
  CSR csr ( // @[DMATop.scala 48:19:@1338.4]
    .io_csr_0_dataOut(csr_io_csr_0_dataOut),
    .io_csr_0_dataWrite(csr_io_csr_0_dataWrite),
    .io_csr_0_dataIn(csr_io_csr_0_dataIn),
    .io_csr_1_dataIn(csr_io_csr_1_dataIn),
    .io_csr_2_dataOut(csr_io_csr_2_dataOut),
    .io_csr_2_dataWrite(csr_io_csr_2_dataWrite),
    .io_csr_2_dataIn(csr_io_csr_2_dataIn),
    .io_csr_3_dataOut(csr_io_csr_3_dataOut),
    .io_csr_3_dataWrite(csr_io_csr_3_dataWrite),
    .io_csr_3_dataIn(csr_io_csr_3_dataIn),
    .io_csr_4_dataOut(csr_io_csr_4_dataOut),
    .io_csr_4_dataWrite(csr_io_csr_4_dataWrite),
    .io_csr_4_dataIn(csr_io_csr_4_dataIn),
    .io_csr_5_dataOut(csr_io_csr_5_dataOut),
    .io_csr_5_dataWrite(csr_io_csr_5_dataWrite),
    .io_csr_5_dataIn(csr_io_csr_5_dataIn),
    .io_csr_6_dataOut(csr_io_csr_6_dataOut),
    .io_csr_6_dataWrite(csr_io_csr_6_dataWrite),
    .io_csr_6_dataIn(csr_io_csr_6_dataIn),
    .io_csr_7_dataOut(csr_io_csr_7_dataOut),
    .io_csr_7_dataWrite(csr_io_csr_7_dataWrite),
    .io_csr_7_dataIn(csr_io_csr_7_dataIn),
    .io_csr_8_dataOut(csr_io_csr_8_dataOut),
    .io_csr_8_dataWrite(csr_io_csr_8_dataWrite),
    .io_csr_8_dataIn(csr_io_csr_8_dataIn),
    .io_csr_9_dataOut(csr_io_csr_9_dataOut),
    .io_csr_9_dataWrite(csr_io_csr_9_dataWrite),
    .io_csr_9_dataIn(csr_io_csr_9_dataIn),
    .io_csr_10_dataOut(csr_io_csr_10_dataOut),
    .io_csr_10_dataWrite(csr_io_csr_10_dataWrite),
    .io_csr_10_dataIn(csr_io_csr_10_dataIn),
    .io_csr_11_dataOut(csr_io_csr_11_dataOut),
    .io_csr_11_dataWrite(csr_io_csr_11_dataWrite),
    .io_csr_11_dataIn(csr_io_csr_11_dataIn),
    .io_csr_12_dataOut(csr_io_csr_12_dataOut),
    .io_csr_12_dataWrite(csr_io_csr_12_dataWrite),
    .io_csr_12_dataIn(csr_io_csr_12_dataIn),
    .io_csr_13_dataOut(csr_io_csr_13_dataOut),
    .io_csr_13_dataWrite(csr_io_csr_13_dataWrite),
    .io_csr_13_dataIn(csr_io_csr_13_dataIn),
    .io_csr_14_dataOut(csr_io_csr_14_dataOut),
    .io_csr_14_dataWrite(csr_io_csr_14_dataWrite),
    .io_csr_14_dataIn(csr_io_csr_14_dataIn),
    .io_csr_15_dataOut(csr_io_csr_15_dataOut),
    .io_csr_15_dataWrite(csr_io_csr_15_dataWrite),
    .io_csr_15_dataIn(csr_io_csr_15_dataIn),
    .io_bus_addr(csr_io_bus_addr),
    .io_bus_dataOut(csr_io_bus_dataOut),
    .io_bus_dataIn(csr_io_bus_dataIn),
    .io_bus_write(csr_io_bus_write),
    .io_bus_read(csr_io_bus_read)
  );
  WorkerCSRWrapper ctl ( // @[DMATop.scala 50:19:@1341.4]
    .clock(ctl_clock),
    .reset(ctl_reset),
    .io_csr_0_dataOut(ctl_io_csr_0_dataOut),
    .io_csr_0_dataWrite(ctl_io_csr_0_dataWrite),
    .io_csr_0_dataIn(ctl_io_csr_0_dataIn),
    .io_csr_1_dataIn(ctl_io_csr_1_dataIn),
    .io_csr_2_dataOut(ctl_io_csr_2_dataOut),
    .io_csr_2_dataWrite(ctl_io_csr_2_dataWrite),
    .io_csr_2_dataIn(ctl_io_csr_2_dataIn),
    .io_csr_3_dataOut(ctl_io_csr_3_dataOut),
    .io_csr_3_dataWrite(ctl_io_csr_3_dataWrite),
    .io_csr_3_dataIn(ctl_io_csr_3_dataIn),
    .io_csr_4_dataOut(ctl_io_csr_4_dataOut),
    .io_csr_4_dataWrite(ctl_io_csr_4_dataWrite),
    .io_csr_4_dataIn(ctl_io_csr_4_dataIn),
    .io_csr_5_dataOut(ctl_io_csr_5_dataOut),
    .io_csr_5_dataWrite(ctl_io_csr_5_dataWrite),
    .io_csr_5_dataIn(ctl_io_csr_5_dataIn),
    .io_csr_6_dataOut(ctl_io_csr_6_dataOut),
    .io_csr_6_dataWrite(ctl_io_csr_6_dataWrite),
    .io_csr_6_dataIn(ctl_io_csr_6_dataIn),
    .io_csr_7_dataOut(ctl_io_csr_7_dataOut),
    .io_csr_7_dataWrite(ctl_io_csr_7_dataWrite),
    .io_csr_7_dataIn(ctl_io_csr_7_dataIn),
    .io_csr_8_dataOut(ctl_io_csr_8_dataOut),
    .io_csr_8_dataWrite(ctl_io_csr_8_dataWrite),
    .io_csr_8_dataIn(ctl_io_csr_8_dataIn),
    .io_csr_9_dataOut(ctl_io_csr_9_dataOut),
    .io_csr_9_dataWrite(ctl_io_csr_9_dataWrite),
    .io_csr_9_dataIn(ctl_io_csr_9_dataIn),
    .io_csr_10_dataOut(ctl_io_csr_10_dataOut),
    .io_csr_10_dataWrite(ctl_io_csr_10_dataWrite),
    .io_csr_10_dataIn(ctl_io_csr_10_dataIn),
    .io_csr_11_dataOut(ctl_io_csr_11_dataOut),
    .io_csr_11_dataWrite(ctl_io_csr_11_dataWrite),
    .io_csr_11_dataIn(ctl_io_csr_11_dataIn),
    .io_csr_12_dataOut(ctl_io_csr_12_dataOut),
    .io_csr_12_dataWrite(ctl_io_csr_12_dataWrite),
    .io_csr_12_dataIn(ctl_io_csr_12_dataIn),
    .io_csr_13_dataOut(ctl_io_csr_13_dataOut),
    .io_csr_13_dataWrite(ctl_io_csr_13_dataWrite),
    .io_csr_13_dataIn(ctl_io_csr_13_dataIn),
    .io_csr_14_dataOut(ctl_io_csr_14_dataOut),
    .io_csr_14_dataWrite(ctl_io_csr_14_dataWrite),
    .io_csr_14_dataIn(ctl_io_csr_14_dataIn),
    .io_csr_15_dataOut(ctl_io_csr_15_dataOut),
    .io_csr_15_dataWrite(ctl_io_csr_15_dataWrite),
    .io_csr_15_dataIn(ctl_io_csr_15_dataIn),
    .io_irq_readerDone(ctl_io_irq_readerDone),
    .io_irq_writerDone(ctl_io_irq_writerDone),
    .io_sync_readerSync(ctl_io_sync_readerSync),
    .io_sync_writerSync(ctl_io_sync_writerSync),
    .io_xferRead_done(ctl_io_xferRead_done),
    .io_xferRead_address(ctl_io_xferRead_address),
    .io_xferRead_length(ctl_io_xferRead_length),
    .io_xferRead_valid(ctl_io_xferRead_valid),
    .io_xferWrite_done(ctl_io_xferWrite_done),
    .io_xferWrite_length(ctl_io_xferWrite_length),
    .io_xferWrite_valid(ctl_io_xferWrite_valid)
  );
  Queue queue ( // @[Decoupled.scala 294:21:@1344.4]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits(queue_io_enq_bits),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits(queue_io_deq_bits)
  );
  assign io_control_aw_awready = csrFrontend_io_ctl_aw_awready; // @[DMATop.scala 56:22:@1368.4]
  assign io_control_w_wready = csrFrontend_io_ctl_w_wready; // @[DMATop.scala 56:22:@1364.4]
  assign io_control_b_bresp = 2'h0; // @[DMATop.scala 56:22:@1363.4]
  assign io_control_b_bvalid = csrFrontend_io_ctl_b_bvalid; // @[DMATop.scala 56:22:@1362.4]
  assign io_control_ar_arready = csrFrontend_io_ctl_ar_arready; // @[DMATop.scala 56:22:@1357.4]
  assign io_control_r_rdata = csrFrontend_io_ctl_r_rdata; // @[DMATop.scala 56:22:@1356.4]
  assign io_control_r_rresp = 2'h0; // @[DMATop.scala 56:22:@1355.4]
  assign io_control_r_rvalid = csrFrontend_io_ctl_r_rvalid; // @[DMATop.scala 56:22:@1354.4]
  assign io_read_aw_awid = 4'h0; // @[DMATop.scala 62:11:@1485.4]
  assign io_read_aw_awaddr = 32'h0; // @[DMATop.scala 62:11:@1484.4]
  assign io_read_aw_awlen = 8'h0; // @[DMATop.scala 62:11:@1483.4]
  assign io_read_aw_awsize = 3'h0; // @[DMATop.scala 62:11:@1482.4]
  assign io_read_aw_awburst = 2'h0; // @[DMATop.scala 62:11:@1481.4]
  assign io_read_aw_awlock = 1'h0; // @[DMATop.scala 62:11:@1480.4]
  assign io_read_aw_awcache = 4'h0; // @[DMATop.scala 62:11:@1479.4]
  assign io_read_aw_awprot = 3'h0; // @[DMATop.scala 62:11:@1478.4]
  assign io_read_aw_awqos = 4'h0; // @[DMATop.scala 62:11:@1477.4]
  assign io_read_aw_awvalid = 1'h0; // @[DMATop.scala 62:11:@1476.4]
  assign io_read_w_wdata = 64'h0; // @[DMATop.scala 62:11:@1474.4]
  assign io_read_w_wstrb = 8'h0; // @[DMATop.scala 62:11:@1473.4]
  assign io_read_w_wlast = 1'h0; // @[DMATop.scala 62:11:@1472.4]
  assign io_read_w_wvalid = 1'h0; // @[DMATop.scala 62:11:@1471.4]
  assign io_read_b_bready = 1'h0; // @[DMATop.scala 62:11:@1466.4]
  assign io_read_ar_arid = 4'h0; // @[DMATop.scala 62:11:@1465.4]
  assign io_read_ar_araddr = readerFrontend_io_bus_ar_araddr; // @[DMATop.scala 62:11:@1464.4]
  assign io_read_ar_arlen = readerFrontend_io_bus_ar_arlen; // @[DMATop.scala 62:11:@1463.4]
  assign io_read_ar_arsize = 3'h3; // @[DMATop.scala 62:11:@1462.4]
  assign io_read_ar_arburst = 2'h1; // @[DMATop.scala 62:11:@1461.4]
  assign io_read_ar_arlock = 1'h0; // @[DMATop.scala 62:11:@1460.4]
  assign io_read_ar_arcache = 4'h2; // @[DMATop.scala 62:11:@1459.4]
  assign io_read_ar_arprot = 3'h0; // @[DMATop.scala 62:11:@1458.4]
  assign io_read_ar_arqos = 4'h0; // @[DMATop.scala 62:11:@1457.4]
  assign io_read_ar_arvalid = readerFrontend_io_bus_ar_arvalid; // @[DMATop.scala 62:11:@1456.4]
  assign io_read_r_rready = readerFrontend_io_bus_r_rready; // @[DMATop.scala 62:11:@1449.4]
  assign io_write_tdata = writerFrontend_io_bus_tdata; // @[DMATop.scala 63:12:@1490.4]
  assign io_write_tvalid = writerFrontend_io_bus_tvalid; // @[DMATop.scala 63:12:@1489.4]
  assign io_write_tuser = 1'h0; // @[DMATop.scala 63:12:@1487.4]
  assign io_write_tlast = writerFrontend_io_bus_tlast; // @[DMATop.scala 63:12:@1486.4]
  assign io_irq_readerDone = ctl_io_irq_readerDone; // @[DMATop.scala 65:10:@1492.4]
  assign io_irq_writerDone = ctl_io_irq_writerDone; // @[DMATop.scala 65:10:@1491.4]
  assign csrFrontend_clock = clock; // @[:@1330.4]
  assign csrFrontend_reset = reset; // @[:@1331.4]
  assign csrFrontend_io_ctl_aw_awaddr = io_control_aw_awaddr; // @[DMATop.scala 56:22:@1371.4]
  assign csrFrontend_io_ctl_aw_awvalid = io_control_aw_awvalid; // @[DMATop.scala 56:22:@1369.4]
  assign csrFrontend_io_ctl_w_wdata = io_control_w_wdata; // @[DMATop.scala 56:22:@1367.4]
  assign csrFrontend_io_ctl_w_wvalid = io_control_w_wvalid; // @[DMATop.scala 56:22:@1365.4]
  assign csrFrontend_io_ctl_b_bready = io_control_b_bready; // @[DMATop.scala 56:22:@1361.4]
  assign csrFrontend_io_ctl_ar_araddr = io_control_ar_araddr; // @[DMATop.scala 56:22:@1360.4]
  assign csrFrontend_io_ctl_ar_arvalid = io_control_ar_arvalid; // @[DMATop.scala 56:22:@1358.4]
  assign csrFrontend_io_ctl_r_rready = io_control_r_rready; // @[DMATop.scala 56:22:@1353.4]
  assign csrFrontend_io_bus_dataIn = csr_io_bus_dataIn; // @[DMATop.scala 57:14:@1374.4]
  assign readerFrontend_clock = clock; // @[:@1333.4]
  assign readerFrontend_reset = reset; // @[:@1334.4]
  assign readerFrontend_io_bus_ar_arready = io_read_ar_arready; // @[DMATop.scala 62:11:@1455.4]
  assign readerFrontend_io_bus_r_rdata = io_read_r_rdata; // @[DMATop.scala 62:11:@1453.4]
  assign readerFrontend_io_bus_r_rlast = io_read_r_rlast; // @[DMATop.scala 62:11:@1451.4]
  assign readerFrontend_io_bus_r_rvalid = io_read_r_rvalid; // @[DMATop.scala 62:11:@1450.4]
  assign readerFrontend_io_dataOut_ready = queue_io_enq_ready; // @[Decoupled.scala 297:17:@1349.4]
  assign readerFrontend_io_xfer_address = ctl_io_xferRead_address; // @[DMATop.scala 59:26:@1443.4]
  assign readerFrontend_io_xfer_length = ctl_io_xferRead_length; // @[DMATop.scala 59:26:@1442.4]
  assign readerFrontend_io_xfer_valid = ctl_io_xferRead_valid; // @[DMATop.scala 59:26:@1441.4]
  assign writerFrontend_clock = clock; // @[:@1336.4]
  assign writerFrontend_reset = reset; // @[:@1337.4]
  assign writerFrontend_io_bus_tready = io_write_tready; // @[DMATop.scala 63:12:@1488.4]
  assign writerFrontend_io_dataIn_valid = queue_io_deq_valid; // @[DMATop.scala 54:9:@1351.4]
  assign writerFrontend_io_dataIn_bits = queue_io_deq_bits; // @[DMATop.scala 54:9:@1350.4]
  assign writerFrontend_io_xfer_length = ctl_io_xferWrite_length; // @[DMATop.scala 60:26:@1446.4]
  assign writerFrontend_io_xfer_valid = ctl_io_xferWrite_valid; // @[DMATop.scala 60:26:@1445.4]
  assign csr_io_csr_0_dataIn = ctl_io_csr_0_dataIn; // @[DMATop.scala 58:14:@1377.4]
  assign csr_io_csr_1_dataIn = ctl_io_csr_1_dataIn; // @[DMATop.scala 58:14:@1381.4]
  assign csr_io_csr_2_dataIn = ctl_io_csr_2_dataIn; // @[DMATop.scala 58:14:@1385.4]
  assign csr_io_csr_3_dataIn = ctl_io_csr_3_dataIn; // @[DMATop.scala 58:14:@1389.4]
  assign csr_io_csr_4_dataIn = ctl_io_csr_4_dataIn; // @[DMATop.scala 58:14:@1393.4]
  assign csr_io_csr_5_dataIn = ctl_io_csr_5_dataIn; // @[DMATop.scala 58:14:@1397.4]
  assign csr_io_csr_6_dataIn = ctl_io_csr_6_dataIn; // @[DMATop.scala 58:14:@1401.4]
  assign csr_io_csr_7_dataIn = ctl_io_csr_7_dataIn; // @[DMATop.scala 58:14:@1405.4]
  assign csr_io_csr_8_dataIn = ctl_io_csr_8_dataIn; // @[DMATop.scala 58:14:@1409.4]
  assign csr_io_csr_9_dataIn = ctl_io_csr_9_dataIn; // @[DMATop.scala 58:14:@1413.4]
  assign csr_io_csr_10_dataIn = ctl_io_csr_10_dataIn; // @[DMATop.scala 58:14:@1417.4]
  assign csr_io_csr_11_dataIn = ctl_io_csr_11_dataIn; // @[DMATop.scala 58:14:@1421.4]
  assign csr_io_csr_12_dataIn = ctl_io_csr_12_dataIn; // @[DMATop.scala 58:14:@1425.4]
  assign csr_io_csr_13_dataIn = ctl_io_csr_13_dataIn; // @[DMATop.scala 58:14:@1429.4]
  assign csr_io_csr_14_dataIn = ctl_io_csr_14_dataIn; // @[DMATop.scala 58:14:@1433.4]
  assign csr_io_csr_15_dataIn = ctl_io_csr_15_dataIn; // @[DMATop.scala 58:14:@1437.4]
  assign csr_io_bus_addr = csrFrontend_io_bus_addr; // @[DMATop.scala 57:14:@1376.4]
  assign csr_io_bus_dataOut = csrFrontend_io_bus_dataOut; // @[DMATop.scala 57:14:@1375.4]
  assign csr_io_bus_write = csrFrontend_io_bus_write; // @[DMATop.scala 57:14:@1373.4]
  assign csr_io_bus_read = csrFrontend_io_bus_read; // @[DMATop.scala 57:14:@1372.4]
  assign ctl_clock = clock; // @[:@1342.4]
  assign ctl_reset = reset; // @[:@1343.4]
  assign ctl_io_csr_0_dataOut = csr_io_csr_0_dataOut; // @[DMATop.scala 58:14:@1379.4]
  assign ctl_io_csr_0_dataWrite = csr_io_csr_0_dataWrite; // @[DMATop.scala 58:14:@1378.4]
  assign ctl_io_csr_2_dataOut = csr_io_csr_2_dataOut; // @[DMATop.scala 58:14:@1387.4]
  assign ctl_io_csr_2_dataWrite = csr_io_csr_2_dataWrite; // @[DMATop.scala 58:14:@1386.4]
  assign ctl_io_csr_3_dataOut = csr_io_csr_3_dataOut; // @[DMATop.scala 58:14:@1391.4]
  assign ctl_io_csr_3_dataWrite = csr_io_csr_3_dataWrite; // @[DMATop.scala 58:14:@1390.4]
  assign ctl_io_csr_4_dataOut = csr_io_csr_4_dataOut; // @[DMATop.scala 58:14:@1395.4]
  assign ctl_io_csr_4_dataWrite = csr_io_csr_4_dataWrite; // @[DMATop.scala 58:14:@1394.4]
  assign ctl_io_csr_5_dataOut = csr_io_csr_5_dataOut; // @[DMATop.scala 58:14:@1399.4]
  assign ctl_io_csr_5_dataWrite = csr_io_csr_5_dataWrite; // @[DMATop.scala 58:14:@1398.4]
  assign ctl_io_csr_6_dataOut = csr_io_csr_6_dataOut; // @[DMATop.scala 58:14:@1403.4]
  assign ctl_io_csr_6_dataWrite = csr_io_csr_6_dataWrite; // @[DMATop.scala 58:14:@1402.4]
  assign ctl_io_csr_7_dataOut = csr_io_csr_7_dataOut; // @[DMATop.scala 58:14:@1407.4]
  assign ctl_io_csr_7_dataWrite = csr_io_csr_7_dataWrite; // @[DMATop.scala 58:14:@1406.4]
  assign ctl_io_csr_8_dataOut = csr_io_csr_8_dataOut; // @[DMATop.scala 58:14:@1411.4]
  assign ctl_io_csr_8_dataWrite = csr_io_csr_8_dataWrite; // @[DMATop.scala 58:14:@1410.4]
  assign ctl_io_csr_9_dataOut = csr_io_csr_9_dataOut; // @[DMATop.scala 58:14:@1415.4]
  assign ctl_io_csr_9_dataWrite = csr_io_csr_9_dataWrite; // @[DMATop.scala 58:14:@1414.4]
  assign ctl_io_csr_10_dataOut = csr_io_csr_10_dataOut; // @[DMATop.scala 58:14:@1419.4]
  assign ctl_io_csr_10_dataWrite = csr_io_csr_10_dataWrite; // @[DMATop.scala 58:14:@1418.4]
  assign ctl_io_csr_11_dataOut = csr_io_csr_11_dataOut; // @[DMATop.scala 58:14:@1423.4]
  assign ctl_io_csr_11_dataWrite = csr_io_csr_11_dataWrite; // @[DMATop.scala 58:14:@1422.4]
  assign ctl_io_csr_12_dataOut = csr_io_csr_12_dataOut; // @[DMATop.scala 58:14:@1427.4]
  assign ctl_io_csr_12_dataWrite = csr_io_csr_12_dataWrite; // @[DMATop.scala 58:14:@1426.4]
  assign ctl_io_csr_13_dataOut = csr_io_csr_13_dataOut; // @[DMATop.scala 58:14:@1431.4]
  assign ctl_io_csr_13_dataWrite = csr_io_csr_13_dataWrite; // @[DMATop.scala 58:14:@1430.4]
  assign ctl_io_csr_14_dataOut = csr_io_csr_14_dataOut; // @[DMATop.scala 58:14:@1435.4]
  assign ctl_io_csr_14_dataWrite = csr_io_csr_14_dataWrite; // @[DMATop.scala 58:14:@1434.4]
  assign ctl_io_csr_15_dataOut = csr_io_csr_15_dataOut; // @[DMATop.scala 58:14:@1439.4]
  assign ctl_io_csr_15_dataWrite = csr_io_csr_15_dataWrite; // @[DMATop.scala 58:14:@1438.4]
  assign ctl_io_sync_readerSync = io_sync_readerSync; // @[DMATop.scala 66:11:@1494.4]
  assign ctl_io_sync_writerSync = io_sync_writerSync; // @[DMATop.scala 66:11:@1493.4]
  assign ctl_io_xferRead_done = readerFrontend_io_xfer_done; // @[DMATop.scala 59:26:@1444.4]
  assign ctl_io_xferWrite_done = writerFrontend_io_xfer_done; // @[DMATop.scala 60:26:@1448.4]
  assign queue_clock = clock; // @[:@1345.4]
  assign queue_reset = reset; // @[:@1346.4]
  assign queue_io_enq_valid = readerFrontend_io_dataOut_valid; // @[Decoupled.scala 295:22:@1347.4]
  assign queue_io_enq_bits = readerFrontend_io_dataOut_bits; // @[Decoupled.scala 296:21:@1348.4]
  assign queue_io_deq_ready = writerFrontend_io_dataIn_ready; // @[DMATop.scala 54:9:@1352.4]
endmodule
