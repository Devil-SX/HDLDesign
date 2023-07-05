#!/bin/bash
rtl_path="./rtl/"
src_files=$(find $rtl_path -name "*.v")
echo $src_files

# 查找.v文件并获取文件名
for file in $(find $rtl_path -name "*.v" | sed 's_.*/__;s/\.v$//')
do
    # 如果文件名包含"_tb"则将其用作顶层模块
    if [[ "$file" =~ .*_tb$ ]]
    then
        top_module=$file
        break
    fi
done

# 如果找到顶层模块则进行仿真
if [ -n "$top_module" ]
then
    # echo $src_files
    iverilog -g2005 -s $top_module -y$rtl_path $src_files -o sim
    vvp -n sim -lxt2
else
    echo "No testbench found!"
fi
