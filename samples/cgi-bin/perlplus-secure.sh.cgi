#!/bin/sh
#
# Copyright (C) 1998 Steve Lidie.  All Rights Reserved.
# (see the accompanying COPYRIGHT files for details of the copyright
#  terms and conditions).
#
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.
#
# perlplus-secure.cgi
#
# This script echos back to the plug-in a string consisting of a single numeric
# character.  Current valid characters are 0, 1, 2, 3, 4, and 5.
#
# The first 'echo' tells the browser what mime-type is associated with this data
# so that it will invoke the correct plug-in.  The second echo supplies the data,
# which tells the plug-in which level of opcode restrictions you wish to use.
 
#echo="/usr/5bin/echo"
echo="/bin/echo"

log="/tmp/perlplus-secure.log"

read  URL
echo "$URL" > $log

# Some potentially useful environment variables you can play with:
#
# DOCUMENT_ROOT=/ahome
# GATEWAY_INTERFACE=CGI/1.1
# HTTP_HOST=www.xyz.edu
# HTTP_REFERER=http://www.xyz.EDU/~sol0/ptk/plop.ppl
# HTTP_USER_AGENT='Mozilla/4.5C-SGI [en] (X11; I; IRIX 6.3 IP32)'
# REMOTE_ADDR=a.b.c.d
# REMOTE_PORT=12801
# REQUEST_METHOD=POST
# REQUEST_URI=/cgi-bin/perlplus-secure.cgi
# SCRIPT_FILENAME=/home/wwwserv/cgi-bin/perlplus-secure.cgi
# SCRIPT_NAME=/cgi-bin/perlplus-secure.cgi
# SERVER_NAME=www.xyz.EDU
# SERVER_PORT=80
# SERVER_PROTOCOL=HTTP/1.0
# SERVER_SOFTWARE=Apache/1.2.6

# This example varies the security level as required for the sample plugins:

URL_ROOT="URL=http://www.Lehigh.EDU/~sol0/ptk/ppl"
url[0]="$URL_ROOT/neko.ppl"
url[1]="$URL_ROOT/plop.ppl"
url[2]="$URL_ROOT/y2k.ppl"
url[3]="$URL_ROOT/thunder.ppl"

sec[0]=4
sec[1]=2
sec[2]=2
sec[3]=2

sec_level=1

idx=0
while [ "$idx" -lt ${#url[*]} ]; do
    if [ "$URL" = "${url[$idx]}" ]; then
        sec_level=${sec[$idx]}
    fi
    let idx=$idx+1
done

echo "  security level=$sec_level" >> $log
                                                    
$echo  "Content-type: application/x-perlplus:.ppl:Perl\n"
$echo  "$sec_level"
