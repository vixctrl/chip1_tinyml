#!/bin/bash
iverilog -o chip1_tinyml_tb.out chip1_tinyml.v chip1_tinyml_tb.v
vvp chip1_tinyml_tb.out
gtkwave chip1_tinyml.vcd &
