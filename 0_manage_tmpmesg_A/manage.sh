TIME=$(date +"%r")
PATH_PROJECT=/home/kmlee/work/my/1scripts/0manage_tmpmesg_A
SIZE_REFRESH=100000

echo "Start manage.sh\n"${TIME} >> ${PATH_PROJECT}/log

#copy and append '/tmp/message' to '[project folder]/userdata' every minute
cat /tmp/message >> ${PATH_PROJECT}/userdata

#if userdata file size is more than 100k, refresh it.
SIZE_FILE=$(stat -c%s ${PATH_PROJECT}/userdata)
echo "file size is "${SIZE_FILE} >> ${PATH_PROJECT}/log
if [ $SIZE_FILE -gt $SIZE_REFRESH ]; then
    echo "  size over" >> ${PATH_PROJECT}/log
    cat /dev/null > ${PATH_PROJECT}/userdata
else
    echo "  size is not over" >> ${PATH_PROJECT}/log
fi
echo "End manage.sh\n"$TIME >> ${PATH_PROJECT}/log
