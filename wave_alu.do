
#  ModelSim DO script – compiles, runs, opens wave
#  Run from:  ModelSim → File → Change Directory → project folder
#  Then:      do wave_alu.do


# --- 1. Create / reset work library ---
vlib work
vmap work work

# --- 2. Compile both files ---
vcom -93 ../ALU/alu_32bit.vhd
vcom -93 ../ALU/tb_alu_32bit.vhd

# --- 3. Load simulation ---
vsim -t 1ns work.tb_alu_32bit

# --- 4. Add all signals to wave window ---
add wave -divider "CLOCK / RESET"
add wave -color Gold      /tb_alu_32bit/CLK
add wave -color Red       /tb_alu_32bit/RST

add wave -divider "INPUTS"
add wave -color Cyan  -radix hex  /tb_alu_32bit/A
add wave -color Cyan  -radix hex  /tb_alu_32bit/B
add wave -color Yellow -radix unsigned /tb_alu_32bit/SEL

add wave -divider "OUTPUTS"
add wave -color Green -radix hex  /tb_alu_32bit/RESULT
add wave -color Orange            /tb_alu_32bit/Z_FLAG

# --- 5. Run until simulation stops (assert failure) ---
run -all

# --- 6. Zoom to fit ---
wave zoom full
