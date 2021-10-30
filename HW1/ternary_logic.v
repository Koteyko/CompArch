module not_switch(in, out);
  input in;
  output out;
  
  supply1 power;
  supply0 ground;
  
  pmos p1(out, power, in);
  nmos n1(out, ground, in);
  
endmodule

module nand_switch(a, b, out);
  input a, b;
  output out;
  wire w;
  
  supply1 power;
  supply0 ground;
  
  nmos n1(w, ground, b);
  nmos n2(out, w, a);
  pmos p1(out, power, a);
  pmos p2(out, power, b);
  
endmodule

module and_switch(a, b, out);
  input a, b;
  output out;
  wire w;
  
  nand_switch my_nand(a, b, w);
  not_switch my_not(w, out);
  
endmodule

module nor_switch(a, b, out);
  input a, b;
  output out;
  
  wire w;
  
  supply1 pwr;
  supply0 gnd;
  
  nmos n1(out, gnd, a);
  nmos n2(out, gnd, b);
  pmos p1(w, pwr, a);
  pmos p2(out, w, b);
  
endmodule

module or_switch(a, b, out);
  input a, b;
  output out;
  wire w;
  
  nor_switch my_nor(a, b, w);
  not_switch my_not(w, out);
endmodule

module xor_switch(a, b, out);
  input a, b;
  output out;
  wire not_a, not_b, not_a_and_b, not_b_and_a;
  
  not_switch not1(a, not_a);
  not_switch not2(b, not_b);
  and_switch and1(not_a, b, not_a_and_b);
  and_switch and2(not_b, a, not_b_and_a);
  or_switch or1(not_a_and_b, not_b_and_a, out);
endmodule

module ternary_min(a0, a1, b0, b1, out0, out1);
  input a0, a1, b0, b1;
  output out0, out1;
  wire a0_or_b0, a1_or_b1, a0_and_b0, a0_nor_b0, w1, w2;
  
  or_switch or1(a0, b0, a0_or_b0);
  or_switch or2(a1, b1, a1_or_b1);
  and_switch and1(a0, b0, a0_and_b0);
  or_switch or3(a1_or_b1, a0_and_b0, w1);
  and_switch and2(w1, a0_or_b0, out0);
  
  not_switch not1(a0_or_b0, a0_nor_b0);
  and_switch and3(a1, b1, w2);
  and_switch and4(a0_nor_b0, w2, out1);
  
endmodule

module ternary_consensus(a0, a1, b0, b1, out0, out1);
  input a0, a1, b0, b1;
  output out0, out1;
  wire a0_or_b0, a1_xor_b1, a0_nor_b0, a1_and_b1;
  
  or_switch or1(a0, b0, a0_or_b0);
  xor_switch xor1(a1, b1, a1_xor_b1);
  or_switch or2(a0_or_b0, a1_xor_b1, out0);
  
  not_switch not1(a0_or_b0, a0_nor_b0);
  and_switch and1(a1, b1, a1_and_b1);
  and_switch and2(a0_nor_b0, a1_and_b1, out1);
  
endmodule

module ternary_max(a0, a1, b0, b1, out0, out1);
  input a0, a1, b0, b1;
  output out0, out1;

endmodule

module ternary_any(a0, a1, b0, b1, out0, out1);
  input a0, a1, b0, b1;
  output out0, out1;

endmodule
