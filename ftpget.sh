#/usr/bin/sh
#
# Author: Jonatan Morales <jonatan.mv@gmail.com>
# Created: 2012-12-20
# Updated: 2012-12-20
#
# Description: Retrieves one or more files from a remote host, using external configuration file.
#              This scripts can be used in the cron in order to get a remote file periodically.
#

LOGFILE=ftpget.log

# Settings from external file (see "settings_sample.conf" file for details)
if [ -f "./ftpget.conf" ]; then
    CONFIG_FILE="./ftpget.conf"
    source ./ftpget.conf
elif [ -f "$HOME/ftpget.conf" ]; then
    CONFIG_FILE="$HOME/ftpget.conf"
    source $HOME/ftpget.conf
elif [ -f "/etc/ftpget.conf" ]; then
    CONFIG_FILE="/etc/ftpget.conf"
    source /etc/ftpget.conf
fi

# Logfile 
logfile_size=$(ls -sk LOGFILE | awk '{print $1}')
if [ $logfile_size -gt 1024 ]; then
    mv $LOGFILE $LOGFILE".old"
fi
timestamp=$(date +%Y-%m-%d\ %H:%M)
echo "$timestamp - Config: $CONFIG_FILE - HOST: $HOST" | tee -a $LOGFILE

# Destination dir
if [ ! -d $LOCAL_PATH ]; then
    mkdir $LOCAL_PATH
fi

# Generate temporal ftp.tmp file with ftp client commands.
cat > ftp.tmp <<EOF
quote USER $USER
quote PASS $PASS
lcd $LOCAL_PATH
EOF

IFS_orig=$IFS
IFS="$(printf '\n\t')"
dir="-1"
dir_prev="-1"
for file in ${REMOTE_FILES[*]}; do
    dir="$(dirname $file)"
    filename="$(basename $file)"
    if [ $dir != $dir_prev ]; then
        printf "cd $dir \n" >> ftp.tmp
    fi
    printf "get $filename \n" >> ftp.tmp
    dir_prev=$dir
done
printf "\n" >> ftp.tmp
IFS=$IFS_orig

cat ftp.tmp | ftp -in $HOST 2>&1 1>> $LOGFILE
rm ftp.tmp
timestamp=$(date +%Y-%m-%d\ %H:%M)
echo "$timestamp - Finish, bye. See ftpget.log dor details." | tee -a $LOGFILE