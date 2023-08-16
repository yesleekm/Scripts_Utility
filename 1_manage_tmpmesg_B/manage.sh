#Constant
PATH_Project=/home/kmlee/work/my/1_scripts/1_manage_tmpmesg_B
PATH_Data=/tmp/message
VALUE_RefreshTime_Day="1"
VALUE_Weighted_Day="100"

#Variable
THRESHOLD_RefreshTime_Day=$((VALUE_RefreshTime_Day*VALUE_Weighted_Day))
TIME_DayHour=$(date +%_d%H)
TIME_Remove=$((TIME_DayHour - THRESHOLD_RefreshTime_Day))

## [TEST] Initiated
echo "Start [tmpmesg manage_B script] at "${TIME_DayHour} >> ${PATH_Project}/log
echo "Should REMOVE file that create before "$TIME_Remove >> ${PATH_Project}/log

# Copy and paste '/tmp/message' to '[project folder]/userdata/{current time-DayHour}' every hours.
cat ${PATH_Data} > ${PATH_Project}/userdata/${TIME_DayHour}

# Read all names on data files and find the files that create before today.
LIST_USERDATA=$(ls ${PATH_Project}/userdata)
for file in $LIST_USERDATA
do 
    if [ $file -le $TIME_Remove ]; then
        echo "   !!! Userdata "$file" need to be removed" >> ${PATH_Project}/log
        rm -f ${PATH_Project}/userdata/${file}
    else
        echo "   Userdata "$file" dont need to be removed" >> ${PATH_Project}/log
    fi  
done

## [TEST] Finished
echo "" >> ${PATH_Project}/log
