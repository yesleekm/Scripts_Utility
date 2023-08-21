#!/bin/bash

#Constant
PATH_Project=/home/kmlee/work/my/1_scripts/2_Monitor_SysResource
PATH_Log=${PATH_Project}/log

#1. Get Cpu usage value and when it exceed 80%, print error message at log
Time_Idle_CPU=$(top -n 1 | grep "Cpu(s)" | awk '{print $8}')
Time_Usage_CPU=$((100-${Time_Idle_CPU%.*}))
if [ "${Time_Usage_CPU}" -ge 80 ]; then
    echo "!!! Cpu usage exceed 80%." >> ${PATH_Log}
else
    echo "Cpu usage is less than 80%." >> ${PATH_Log}
fi