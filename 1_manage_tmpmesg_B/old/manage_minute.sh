TIME=$(date +%_I%M)
PATH_PROJECT=/home/kmlee/work/my/1scripts/1manage_tmpmesg_B
PATH_DATA=/tmp/message
THRESHOLD_TIME="5"

echo "Start tmpmesg manage_B at "${TIME} >> ${PATH_PROJECT}/log

#copy and paste '/tmp/message' to '[project folder]/userdata/{current time}' every minute
cat $PATH_DATA > ${PATH_PROJECT}/userdata/${TIME}

#Remove file that create before 5 minutes.
LIST_USERDATA=$(ls ${PATH_PROJECT}/userdata)
TIME_REMOVE=$((TIME - THRESHOLD_TIME))
echo "REMOVE FILE THAT CREATE BEFORE "$TIME_REMOVE >> ${PATH_PROJECT}/log
for file in $LIST_USERDATA
do 
    if [ $file -le $TIME_REMOVE ]; then
        echo "   !!! Userdata "$file" need to removed" >> ${PATH_PROJECT}/log
        rm -f ${PATH_PROJECT}/userdata/${file}
    else
        echo "   Userdata "$file" dont need to removed" >> ${PATH_PROJECT}/log
    fi  
done

echo "" >> ${PATH_PROJECT}/log
###echo "End tmpmesg manage_B at "$TIME"\n" >> ${PATH_PROJECT}/log