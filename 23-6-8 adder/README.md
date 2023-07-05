# 平方根进位选择加法器

循环例化

```verilog
  genvar i;
  generate

    for (i = 2; i <= 10; i=i+1) begin : adder_instance
      select_adder #(.COUNT(i)) sel(
        .A(A[end_calculate(i):start_calculate(i)]),
        .B(B[end_calculate(i):start_calculate(i)]),
        .Cin(carry_interconnect[i-2]),
        .S(SUM[end_calculate(i):start_calculate(i)]),
        .Cout(carry_interconnect[i-1])
      );
    end
  endgenerate
```