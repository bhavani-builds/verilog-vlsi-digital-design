# Verilog VLSI Digital Design

A collection of synthesizable **Verilog RTL designs** covering fundamental digital circuits, sequential logic, arithmetic units, memory structures, communication interfaces, FSMs, and an integrated RTL system.

This project is developed to strengthen practical skills in **Digital Electronics, Verilog HDL, RTL Design, VLSI Design, and Hardware Verification**.

---

## About the Project

This repository contains a progressive set of Verilog implementations starting from basic digital logic and moving toward more advanced RTL designs.

The designs are written using **Verilog HDL** and are accompanied by testbenches for functional verification.

The project covers:

- Combinational logic
- Arithmetic circuits
- Sequential circuits
- Registers and counters
- Shift registers
- ALU design
- FIFO memory
- Finite State Machines
- UART communication
- Integrated RTL system design

---

## Technologies Used

- **Verilog HDL**
- **RTL Design**
- **Digital Logic Design**
- **VLSI Design**
- **Simulation & Verification**
- **Testbench Development**

### Tools

The Verilog modules can be simulated using tools such as:

- Icarus Verilog
- ModelSim
- QuestaSim
- Vivado
- EDA Playground

---

## Designs Implemented

### 1. Logic Gates

Implementation of basic digital logic gates:

- AND
- OR
- NOT
- NAND
- NOR
- XOR
- XNOR

---

### 2. Adders

Implemented:

- Half Adder
- Full Adder

The full adder supports:

- Two input bits
- Carry input
- Sum output
- Carry output

---

### 3. Subtractors

Implemented:

- Half Subtractor
- Full Subtractor

The designs generate:

- Difference
- Borrow

---

### 4. 4-bit Comparator

A magnitude comparator that determines:

- A > B
- A = B
- A < B

---

### 5. Multiplexer and Demultiplexer

Implemented:

- 4-to-1 Multiplexer
- 1-to-4 Demultiplexer

These designs demonstrate data selection and routing using control signals.

---

### 6. Encoder and Decoder

Implemented:

- 2-to-4 Decoder
- 4-to-2 Encoder

The encoder also includes a valid-output signal.

---

### 7. Priority Encoder

Implemented a 4-to-2 priority encoder with:

- Priority logic
- Encoded output
- Valid output

Priority order:

```text
I3 > I2 > I1 > I0
