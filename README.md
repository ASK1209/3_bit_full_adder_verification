# 3-bit Full Adder Verification Project
A comprehensive SystemVerilog verification environment for a 3-bit Full Adder, simulated on **EDA Playground** using the **Aldec Riviera Pro** toolchain.

## 🚀 Project Overview
This project verifies a 3-bit adder that takes two 3-bit inputs (`a`, `b`) and a carry-in (`cin`), producing a 3-bit sum and a separate carry-out bit. The environment uses a constrained-random approach to ensure robust hardware reliability.

### 🔗 Run on EDA Playground
https://www.edaplayground.com/x/tjAy

## 🛠️ Verification Architecture
The testbench uses a modern SystemVerilog approach:
- **Transaction-Based Randomization**: A class-based generator creates 30+ random input combinations for `a`, `b`, and `cin`.
- **Separate Output Monitoring**: Unlike basic models, this TB verifies `sum` and `cout` as distinct signals to ensure bit-accurate addition.
- **Functional Coverage**: A `covergroup` monitors the input space to ensure we test both low-value additions and maximum-value overflows (7 + 7 + 1).
- **Self-Checking Assertions**:
  - `assert(sum == expected)`: Validates the 3rd-bit wrap-around logic.
  - `assert(cout == expected)`: Validates the carry-out generation logic.

## 📁 File Structure
- `rtl.sv`: 3-bit Full Adder RTL using internal 4-bit logic to prevent truncation.
- `tb.sv`: SystemVerilog Testbench with `rand` classes, `covergroups`, and `assertions`.
- `run.do`: TCL script to enable **Aldec Riviera Pro** coverage database and console reporting.

## 📊 How to Analyze Results
1. **Console Log**: Check the final coverage percentage at the end of the simulation.
2. **Coverage Report**: View `cov_report.txt` in the results pane for a detailed breakdown of which input combinations were hit.
3. **EPWave**: 
   - Add signals `a`, `b`, `sum`, and `cout`.
   - **Pro Tip**: Right-click `a`, `b`, and `sum` in EPWave and set the **Radix to Decimal** for easier visual verification.

## 🛡️ Assertions in Action
The testbench is designed to "fail-fast." If the RTL logic deviates from the mathematical expected value by even one bit, the simulation will flag an `ERROR` in the log with the exact timestamp and signal values.

## 👩‍💻 Author

**Ahalya Sivakumar**  
Design Verification Engineer  
SystemVerilog | SVA | Functional Coverage | UVM (Learning)
