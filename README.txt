
man(1)                        getftp.sh man page                        man(1)



NAME
       getftp.sh − Gets remote files via ftp.


SYNOPSYS
       getftp.sh  is a shell script for getting remote files using ftp connec‐
       tion to remote server.


DESCRIPTION
       getftp.sh reads the getftp.conf configration  file  and  retrieves  the
       remote files in this config file.


OPTIONS
       You  can  configure  the behaviour via text files. The config files is:
       "getftp.conf" ‐‐> General configuration file.


EXAMPLE
       An example of execution (after configuration files are done)  is  quite
       simple:  "sh getftp.sh".  This script can be added to the cron in order
       to execute it periodically.


SEE ALSO
       ftp(1) cron(8)


BUGS
       No known bugs.


AUTHOR
       Jonatan Morales <jonatan.mv@gmail.com>


INSTALL
       The recomended platform for running getftp script is Linux.


   Linux or Mac
       To install the bakup.sh utility in Linux os Mac:
       1. Create the folder /opt/getftp/
       2. Copy the getftp.sh file to /opt/getftp/
       3. Copy the getftp.conf file to /opt/getftp/
       4. Edit and personalize the config file
       5. Copy the man file getftp.man to the manpages directory of your  sys‐
       tem.


   Windows
       For  windows  users you can install the cygwin software and then follow
       the previous steps.



v1.0                              2012‐12‐22                            man(1)
