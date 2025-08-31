
#2763: Clean up the result of some math operations on operands of different types
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[Epic]
<https://github.com/red/red/issues/2763>

Expected results are described in this Excel matrix: https://github.com/red/red/blob/master/docs/math-ops-matrix.xlsx

This epic issue gathers all opened issues related to that topic.

The resulting type of a math operation on hetorogeneous datatypes is (in decreasing order of precedence):
1. Higher dimension type
2. Higher precision type
3. Left operand type

For division operation, the resulting type can be changed to a higher-precision one.



