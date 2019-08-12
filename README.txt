
man(1)                        getftp.sh man page                        man(1)



NNAAMMEE
       getftp.sh - Gets remote files via ftp.


SSYYNNOOPPSSIISS
       getftp.sh  is a shell script for getting remote files using ftp connec-
       tion to remote server.


DDEESSCCRRIIPPTTIIOONN
       getftp.sh reads the getftp.conf configration  file  and  retrieves  the
       remote files in this config file.


OOPPTTIIOONNSS
       You  can  configure  the behaviour via text files. The config files is:
       "getftp.conf" --> General configuration file.


EEXXAAMMPPLLEE
       An example of execution (after configuration files are done)  is  quite
       simple:  "sh getftp.sh".  This script can be added to the cron in order
       to execute it periodically.


SSEEEE AALLSSOO
       ftp(1) cron(8)


BBUUGGSS
       No known bugs.


AAUUTTHHOORR
       Jonatan Morales <jonatan.mv@gmail.com>


IINNSSTTAALLLL
       The recomended platform for running getftp script is Linux.


   LLiinnuuxx oorr MMaacc
       To install the bakup.sh utility in Linux os Mac:
       1. Create the folder /opt/getftp/
       2. Copy the getftp.sh file to /opt/getftp/
       3. Copy the getftp.conf file to /opt/getftp/
       4. Edit and personalize the config file
       5. Copy the man file getftp.man to the manpages directory of your  sys-
       tem.


   WWiinnddoowwss
       For  windows  users you can install the cygwin software and then follow
       the previous steps.



v1.0                              2012-12-22                            man(1)
