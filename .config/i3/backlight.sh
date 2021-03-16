#!/bin/bash

backlight=$(cat /sys/class/backlight/amdgpu_bl0/brightness)

if (($1 == "dec"));then
    echo $((backlight - 10)) >> /sys/class/backlight/amdgpu_bl0/brightness
elif (($1 == "inc"));then
    echo $((backlight + 10)) >> /sys/class/backlight/amdgpu_bl0/brightness
fi
