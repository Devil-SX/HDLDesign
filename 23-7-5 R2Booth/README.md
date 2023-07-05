简单的2基Booth乘法器 其中加法减法尚未用门级实现

中间debug de了好久，因此可以看到`booth2.v` 中许多`$display`

bug原因：

`>>>`算术右移只会对声明了符号的变量有效，否则等同逻辑右移

`reg signed`或者`$signed(x)`