# 🛠️ Design and Verification of (7,4) Hamming Code | RTL to GDSII

## 📌 Project Overview

This project demonstrates the complete **RTL-to-GDSII ASIC design flow** using a **(7,4) Hamming Code Encoder and Decoder**. The design is implemented in **Verilog HDL**, functionally verified using a testbench, and taken through the major stages of the ASIC physical design flow.

The project focuses on designing a Hamming Code system capable of encoding 4-bit input data into a 7-bit Hamming codeword and detecting and correcting single-bit errors during decoding.

The complete workflow includes:

- RTL Design
- RTL Functional Verification
- Waveform Generation
- Logic Synthesis
- Floorplanning
- Power Planning
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Physical Verification
- GDSII Generation

---

## 🎯 Objective

The main objective of this project is to implement and verify a **(7,4) Hamming Code** and understand the complete **ASIC RTL-to-GDSII design methodology** using industry-standard EDA tools.

---

## 🧠 What is Hamming (7,4) Code?

Hamming (7,4) is an error-correcting code that:

- Accepts **4-bit input data**
- Generates a **7-bit encoded codeword**
- Detects single-bit errors
- Corrects single-bit errors

The design uses parity bits generated using XOR operations.

### Codeword Structure

```text
[p1 p2 d1 p3 d2 d3 d4]
